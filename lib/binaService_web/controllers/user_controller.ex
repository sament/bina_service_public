defmodule BinaServiceWeb.UserController do
  use BinaServiceWeb, :controller

  alias BinaService.Identities
  alias BinaService.Identities.User
  alias BinaService.Guardian

  action_fallback BinaServiceWeb.FallbackController

  def index(conn, _params) do
    users = Identities.list_users()
    render(conn, "index.json", users: users)
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Identities.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        conn |> render("jwt.json", jwt: token)
      _ ->
        {:error, :unauthorized}
    end
  end

  #used for registering a new user and log in directly
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Identities.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user)  do
         conn |> render("jwt.json", jwt: token)
      # conn
      # |> put_status(:created)
      # |> put_resp_header("location", Routes.user_path(conn, :show, user))
      # |> render("show.json", user: user)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   user = Identities.get_user!(id)
  #   render(conn, "show.json", user: user)
  # end

  #gets the current logged in user
  def show(conn, params, opts \\ %{active_user: true}) do
   case opts do

    {:active_user, :true} ->
      user = Guardian.Plug.current_resource(conn)
      conn |> render("user.json", user: user)

    {:active_user, :false} ->
      %{"id" => id} = params
      user = Identities.get_user!(id)
      conn |> render("user.json", user: user)

   end

  end



  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Identities.get_user!(id)

    with {:ok, %User{} = user} <- Identities.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

def delete(conn, %{"id" => id}) do
    user = Identities.get_user!(id)

    with {:ok, %User{}} <- Identities.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end

