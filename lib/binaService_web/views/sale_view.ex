defmodule BinaServiceWeb.SaleView do
  use BinaServiceWeb, :view
  alias BinaServiceWeb.SaleView



  # = = = =
  # CONSUMERS
  # = = = =

  def render("consumers.json", %{consumers: consumers}) do
    %{data: render_many(consumers, SaleView, "consumers.json")}
  end

  def render("show_consumer.json", %{consumer: consumer}) do
    %{data: render_one(consumer, SaleView, "consumer.json")}
  end


  def render("consumer.json", %{consumer: consumer}) do
    %{id: consumer.id,
      user_id: consumer.user_id,
      name: consumer.name,
      tags: consumer.tags,
      created_at: consumer.created_at,
      updated_at: consumer.updated_at}
  end



# = = = = =
# PROVIDERS
# = = = = =
def render("providers.json", %{providers: providers}) do
  %{data: render_many(providers, SaleView, "providers.json")}
end

def render("show_provider.json", %{provider: provider}) do
  %{data: render_one(provider, SaleView, "provider.json")}
end


def render("provider.json", %{provider: provider}) do
  %{id: provider.id,
    user_id: provider.user_id,
    name: provider.name,
    tags: provider.tags,
    created_at: provider.created_at,
    updated_at: provider.updated_at}
end


# = = = = =
# ORDERS
# = = = = =

  def render("orders.json", %{orders: orders}) do
    %{data: render_many(orders, SaleView, "orders.json")}
  end

  def render("show_order.json", %{order: order}) do
    %{data: render_one(order, SaleView, "order.json")}
  end

end
