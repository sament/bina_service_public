defmodule BinaServiceWeb.SaleController do
  use BinaServiceWeb, :controller

  # alias BinaService.Identities
  # alias BinaService.Identities.User
  Ecto.NoResultsError

  alias BinaService.Sales
  alias BinaService.Sales.Order
  alias BinaService.Sales.Consumer
  # alias BinaService.Sales.Bill

  action_fallback BinaServiceWeb.FallbackController

  # = = = = = = = =
  # CONSUMER
  # = = = = = = = =
  def consumers(conn, _params) do
    consumers = Sales.list_consumers()
    render(conn, "consumers.json", consumers: consumers)
  end

  def show_consumer(conn, %{"id" => id}) do
    with %Consumer{} = consumer <- Sales.get_consumer!(id) do
      render(conn, "show_consumer.json", consumer: consumer)
    end
   end

   def create_consumer(conn, %{"consumer" => consumer_params}) do
    with {:ok, %consumer{} = consumer} <- Sales.create_consumer(consumer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sale_path(conn, :show_consumer, consumer))
      |> render("consumer.json", consumer: consumer)
    end
  end



  # = = = = = = = =
  # PROVIDER
  # = = = = = = = =

  def providers(conn, _params) do
    providers = Sales.list_providers()
    render(conn, "providers.json", providers: providers)
  end

  def show_provider(conn, %{"id" => id}) do
    # with %provider{} = provider <- Sales.get_provider!(id) do
    #   render(conn, "show_provider.json", provider: provider)
    #   #  conn |> put_status(422) |> render("error.json", %{message: "cannot process"})
    # end
    IO.inspect "get_provider before case"
    case Sales.get_provider!(id) do
    {:ok, provider} ->
      render(conn, "show_provider.json", provider: provider)

      nil ->
        IO.inspect "get_provider inside nil"
        {:error, :not_found}
      _ ->
        IO.inspect "get_provider last case"
        conn |> put_status(422) |> render("error.json", %{message: "cannot process"})
    end
  rescue
    Ecto.NoResultsError -> {:error, :not_found} #Goes to FallBackController
   end

   def create_provider(conn, %{"provider" => provider_params}) do
    with {:ok, %provider{} = provider} <- Sales.create_provider(provider_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sale_path(conn, :show_provider, provider))
      |> render("provider.json", provider: provider)
    end
  end


  # = = = = = = = =
  # ORDERS
  # = = = = = = = =



  def orders(conn, _params) do
    orders = Sales.list_orders()
    render(conn, "orders.json", orders: orders)
  end

 def show_order(conn, %{"id" => id}) do
  # with %Order{} = order <- Sales.get_order!(id) do
  #   render(conn, "show_order.json", order: order)
  # end

  case Sales.get_order!(id) do

    {:ok, %Order{} = order} ->
      render(conn, "show_order.json", order: order)
    __ ->
        {:error, :not_found}

  end


 end


 def create_order(conn, %{"order" => order_params}) do
  with {:ok, %Order{} = order} <- Sales.create_order(order_params) do
    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.sale_path(conn, :show_order, order))
    |> render("order.json", order: order)
  end
end



# def delete(conn, %{"id" => id}) do
#   user = Identities.get_user!(id)

#   with {:ok, %User{}} <- Identities.delete_user(user) do
#     send_resp(conn, :no_content, "")
#   end
# end
end
