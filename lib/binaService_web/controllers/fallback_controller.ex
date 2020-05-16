defmodule BinaServiceWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use BinaServiceWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Login error"})
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(BinaServiceWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :cast_error}) do
    conn
    |> put_status(:not_found)
    |> put_view(BinaServiceWeb.ErrorView)
    |> render(:"422")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(BinaServiceWeb.ErrorView)
    |> render(:"404")
  end


  #By Sam Iso
  # used to catch exceptions   from Repo overrides in
  #  BinaService.Repo
  # Ecto.Query.CastError -> nil
  # Ecto.NoResultsError -> nil
  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> put_view(BinaServiceWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, _}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(BinaServiceWeb.ErrorView)
    |> render(:"422")
  end
end
