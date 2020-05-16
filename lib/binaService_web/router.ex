defmodule BinaServiceWeb.Router do
  use BinaServiceWeb, :router

  alias BinaService.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", BinaServiceWeb do
    pipe_through :api

    # resources "/webhooks/twillio", TwillioController

    post "/webhooks/twillio", TwillioController, :handle_hook
    post "/webhooks/twillio/bot", TwillioController, :handle_bot

    # resources "/users", UserController, only: [:create, :show]
    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in

    resources "identities/profiles", ProfileController

    get "/sales/consumers", SaleController, :consumers
    get "/sales/providers", SaleController, :providers

    get "/sales/orders", SaleController, :orders
    get "/sales/order/:id", SaleController, :show_order

    post "/sales/order", SaleController, :create_order
    post "/sales/provider", SaleController, :create_provider
    post "/sales/consumer", SaleController, :create_consumer

    get "/sales/consumer/:id", SaleController, :show_consumer
    get "/sales/provider/:id", SaleController, :show_provider

  end


  scope "/api/v1", BinaServiceWeb do
    pipe_through [:api, :jwt_authenticated]
    get "/my_user", UserController, :show
  end

end
