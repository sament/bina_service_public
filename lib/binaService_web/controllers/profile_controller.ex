defmodule BinaServiceWeb.ProfileController do
  use BinaServiceWeb, :controller

  alias BinaService.Identities
  alias BinaService.Identities.User
  alias BinaService.Identities.Profile
  alias BinaService.Guardian

  action_fallback BinaServiceWeb.FallbackController


  def index(conn, _params) do
    profiles = Identities.list_profiles()
    render(conn, "index.json", profiles: profiles)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Profile{} = profile} <- Identities.get_profile!(id) do
      conn |> render("show.json", profile: profile)
    end
  end

  def create(conn, %{"profile" => profile_params}) do

    with {:ok, %Profile{} = profile} <- Identities.create_profile(profile_params) do
      # {:ok, profile} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.profile_path(conn, :show, profile))
        |> render("show.json", profile: profile)
    end
  #   case Identities.get_user!(profile_params.user_id) do
  #     nil ->
  #      # case for user not found
  #     %Identities.User{} = user ->
  #     with {:ok, %Profile{} = profile} <- Identities.create_profile(profile_params) do
  #       conn
  #       |> put_status(:created)
  #       |> put_resp_header("location", Routes.profile_path(conn, :show, profile))
  #       |> render("show.json", profile: profile)
  #     end

  # end
end

end
