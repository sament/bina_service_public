defmodule BinaServiceWeb.TwillioView do
  use BinaServiceWeb, :view
  alias BinaServiceWeb.TwillioView





# = = = = =
# DATA
# = = = = =


def render("index.json", %{response: response}) do
  # %{data: render_many(users, TwillioView, "user.json")}
  # %{data: users |> Map.delete(":__meta__") |> Jason.encode! }
  %{data: response}
end

def render("show.json", %{user: user}) do
  %{data: render_one(user, TwillioView, "user.json")}
end

def render("user.json", %{user: user}) do
  %{id: user.id,
    email: user.email,
    phone: user.phone,
    password_hash: user.password_hash,
    username: user.username}
end




end
