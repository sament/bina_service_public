defmodule BinaService.Identities do
  @moduledoc """
  The Identities context.
  """

  import Ecto.Query, warn: false
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias BinaService.Guardian
  alias BinaService.Repo
  alias BinaService.Identities.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    Repo.get!(User, id)
  rescue
    Ecto.Query.CastError -> nil #or use Ecto.UUID.dump/1 to validate id before calling this function
  end



   @doc """
  Gets a single user by Email.

  Raises `Login error` if the User does not exist.

  """

    defp get_by_email(email) when is_binary(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        dummy_checkpw()
        {:error, "Login error."}
      user ->
        {:ok, user}
    end
  end

  defp verify_password(password, %User{} = user) when is_binary(password) do
    if checkpw(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end

    defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    with {:ok, user} <- get_by_email(email),
    do: verify_password(password, user)
  end

  def token_sign_in(email, password) do
    case email_password_auth(email, password) do
      {:ok, user} ->#If system returns this
        Guardian.encode_and_sign(user)
      _ -> #Anything else do this
        {:error, :unauthorized}
    end
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias BinaService.Identities.Profile

  @doc """
  Returns the list of profiles.

  ## Examples

      iex> list_profiles()
      [%Profile{}, ...]

  """
  def list_profiles do
    Repo.all(Profile)
  end

  def profiles do
    list_profiles()
  end

  @doc """
  Gets a single profile.

  Raises `Ecto.NoResultsError` if the Profile does not exist.

  ## Examples

      iex> get_profile!(123)
      %Profile{}

      iex> get_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile!(id), do: Repo.get!(Profile, id)

  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile(attrs \\ %{}) do
    %Profile{}
    |> Profile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile.

  ## Examples

      iex> update_profile(profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_profile(profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile(%Profile{} = profile, attrs) do
    profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Profile.

  ## Examples

      iex> delete_profile(profile)
      {:ok, %Profile{}}

      iex> delete_profile(profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile(%Profile{} = profile) do
    Repo.delete(profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile changes.

  ## Examples

      iex> change_profile(profile)
      %Ecto.Changeset{source: %Profile{}}

  """
  def change_profile(%Profile{} = profile) do
    Profile.changeset(profile, %{})
  end



  alias BinaService.Identities.Expertise

  ## -----------------------------------------------


  @doc """
  Returns the list of expertise.

  ## Examples

      iex> list_expertise()
      [%Expertise{}, ...]

  """
  def list_expertise do
    Repo.all(Expertise)
  end

  def expertise do
    list_expertise()
  end

  @doc """
  Gets a single expertise.

  Raises `Ecto.NoResultsError` if the Expertise does not exist.

  ## Examples

      iex> get_expertise!(123)
      %Expertise{}

      iex> get_expertise!(456)
      ** (Ecto.NoResultsError)

  """
  def get_expertise!(id), do: Repo.get!(Expertise, id)

  @doc """
  Creates a expertise.

  ## Examples

      iex> create_expertise(%{field: value})
      {:ok, %Expertise{}}

      iex> create_expertise(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_expertise(attrs \\ %{}) do
    %Expertise{}
    |> Expertise.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a expertise.

  ## Examples

      iex> update_expertise(expertise, %{field: new_value})
      {:ok, %Expertise{}}

      iex> update_expertise(expertise, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_expertise(%Expertise{} = expertise, attrs) do
    expertise
    |> Expertise.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Expertise.

  ## Examples

      iex> delete_expertise(expertise)
      {:ok, %Expertise{}}

      iex> delete_expertise(expertise)
      {:error, %Ecto.Changeset{}}

  """
  def delete_expertise(%Expertise{} = expertise) do
    Repo.delete(expertise)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking expertise changes.

  ## Examples

      iex> change_expertise(expertise)
      %Ecto.Changeset{source: %Expertise{}}

  """
  def change_expertise(%Expertise{} = expertise) do
    Expertise.changeset(expertise, %{})
  end


end

# install pulseaudio-module-bluetooth
# pactl load-module module-bluetooth-discover
