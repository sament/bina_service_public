defmodule BinaService.Sales do
  @moduledoc """
  The Sales context.
  Business logic for ordering and fulfillment
  """

  import Ecto.Query, warn: false
  alias BinaService.Repo

  alias BinaService.Sales.Consumer

  @doc """
  Returns the list of consumers.

  ## Examples

      iex> list_consumers()
      [%Consumer{}, ...]

  """
  def list_consumers do
    Repo.all(Consumer)
  end

  @doc """
  Gets a single consumer.

  Raises `Ecto.NoResultsError` if the Consumer does not exist.

  ## Examples

      iex> get_consumer!(123)
      %Consumer{}

      iex> get_consumer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consumer!(id), do: Repo.get!(Consumer, id)

  @doc """
  Creates a consumer.

  ## Examples

      iex> create_consumer(%{field: value})
      {:ok, %Consumer{}}

      iex> create_consumer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consumer(attrs \\ %{}) do
    %Consumer{}
    |> Consumer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consumer.

  ## Examples

      iex> update_consumer(consumer, %{field: new_value})
      {:ok, %Consumer{}}

      iex> update_consumer(consumer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consumer(%Consumer{} = consumer, attrs) do
    consumer
    |> Consumer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Consumer.

  ## Examples

      iex> delete_consumer(consumer)
      {:ok, %Consumer{}}

      iex> delete_consumer(consumer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consumer(%Consumer{} = consumer) do
    Repo.delete(consumer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consumer changes.

  ## Examples

      iex> change_consumer(consumer)
      %Ecto.Changeset{source: %Consumer{}}

  """
  def change_consumer(%Consumer{} = consumer) do
    Consumer.changeset(consumer, %{})
  end

  alias BinaService.Sales.Provider

  @doc """
  Returns the list of providers.

  ## Examples

      iex> list_providers()
      [%Provider{}, ...]

  """
  def list_providers do
    Repo.all(Provider)
  end

  @doc """
  Gets a single provider.

  Raises `Ecto.NoResultsError` if the Provider does not exist.

  ## Examples

      iex> get_provider!(123)
      %Provider{}

      iex> get_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider!(id), do: Repo.get!(Provider, id)
    # case Repo.get!(Provider, id) do
    #   {:ok, provider} -> {:ok, provider}

    #   _ -> {:error}
    # end


  @doc """
  Creates a provider.

  ## Examples

      iex> create_provider(%{field: value})
      {:ok, %Provider{}}

      iex> create_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_provider(attrs \\ %{}) do
    %Provider{}
    |> Provider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a provider.

  ## Examples

      iex> update_provider(provider, %{field: new_value})
      {:ok, %Provider{}}

      iex> update_provider(provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_provider(%Provider{} = provider, attrs) do
    provider
    |> Provider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Provider.

  ## Examples

      iex> delete_provider(provider)
      {:ok, %Provider{}}

      iex> delete_provider(provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_provider(%Provider{} = provider) do
    Repo.delete(provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking provider changes.

  ## Examples

      iex> change_provider(provider)
      %Ecto.Changeset{source: %Provider{}}

  """
  def change_provider(%Provider{} = provider) do
    Provider.changeset(provider, %{})
  end

  alias BinaService.Sales.Service

  @doc """
  Returns the list of services.

  ## Examples

      iex> list_services()
      [%Service{}, ...]

  """
  def list_services do
    Repo.all(Service)
  end

  @doc """
  Gets a single service.

  Raises `Ecto.NoResultsError` if the Service does not exist.

  ## Examples

      iex> get_service!(123)
      %Service{}

      iex> get_service!(456)
      ** (Ecto.NoResultsError)

  """
  def get_service!(id), do: Repo.get!(Service, id)

  @doc """
  Creates a service.

  ## Examples

      iex> create_service(%{field: value})
      {:ok, %Service{}}

      iex> create_service(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_service(attrs \\ %{}) do
    %Service{}
    |> Service.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service.

  ## Examples

      iex> update_service(service, %{field: new_value})
      {:ok, %Service{}}

      iex> update_service(service, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_service(%Service{} = service, attrs) do
    service
    |> Service.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Service.

  ## Examples

      iex> delete_service(service)
      {:ok, %Service{}}

      iex> delete_service(service)
      {:error, %Ecto.Changeset{}}

  """
  def delete_service(%Service{} = service) do
    Repo.delete(service)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service changes.

  ## Examples

      iex> change_service(service)
      %Ecto.Changeset{source: %Service{}}

  """
  def change_service(%Service{} = service) do
    Service.changeset(service, %{})
  end

  alias BinaService.Sales.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id) do
    Repo.get!(Order, id)
  rescue
    Ecto.Query.CastError ->
    {:error, :not_found}
  end

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  def create_bot_order(attrs \\ %{}) do
    %Order{}
    |> Order.bot_order_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{source: %Order{}}

  """
  def change_order(%Order{} = order) do
    Order.changeset(order, %{})
  end

  alias BinaService.Sales.OrderEvent

  @doc """
  Returns the list of order_events.

  ## Examples

      iex> list_order_events()
      [%OrderEvent{}, ...]

  """
  def list_order_events do
    Repo.all(OrderEvent)
  end

  @doc """
  Gets a single order_event.

  Raises `Ecto.NoResultsError` if the Order event does not exist.

  ## Examples

      iex> get_order_event!(123)
      %OrderEvent{}

      iex> get_order_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_event!(id), do: Repo.get!(OrderEvent, id)

  @doc """
  Creates a order_event.

  ## Examples

      iex> create_order_event(%{field: value})
      {:ok, %OrderEvent{}}

      iex> create_order_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_event(attrs \\ %{}) do
    %OrderEvent{}
    |> OrderEvent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_event.

  ## Examples

      iex> update_order_event(order_event, %{field: new_value})
      {:ok, %OrderEvent{}}

      iex> update_order_event(order_event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_event(%OrderEvent{} = order_event, attrs) do
    order_event
    |> OrderEvent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a OrderEvent.

  ## Examples

      iex> delete_order_event(order_event)
      {:ok, %OrderEvent{}}

      iex> delete_order_event(order_event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_event(%OrderEvent{} = order_event) do
    Repo.delete(order_event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_event changes.

  ## Examples

      iex> change_order_event(order_event)
      %Ecto.Changeset{source: %OrderEvent{}}

  """
  def change_order_event(%OrderEvent{} = order_event) do
    OrderEvent.changeset(order_event, %{})
  end

  alias BinaService.Sales.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{source: %Item{}}

  """
  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end

  alias BinaService.Sales.ServiceItem

  @doc """
  Returns the list of service_items.

  ## Examples

      iex> list_service_items()
      [%ServiceItem{}, ...]

  """
  def list_service_items do
    Repo.all(ServiceItem)
  end

  @doc """
  Gets a single service_item.

  Raises `Ecto.NoResultsError` if the Service item does not exist.

  ## Examples

      iex> get_service_item!(123)
      %ServiceItem{}

      iex> get_service_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_service_item!(id), do: Repo.get!(ServiceItem, id)

  @doc """
  Creates a service_item.

  ## Examples

      iex> create_service_item(%{field: value})
      {:ok, %ServiceItem{}}

      iex> create_service_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_service_item(attrs \\ %{}) do
    %ServiceItem{}
    |> ServiceItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service_item.

  ## Examples

      iex> update_service_item(service_item, %{field: new_value})
      {:ok, %ServiceItem{}}

      iex> update_service_item(service_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_service_item(%ServiceItem{} = service_item, attrs) do
    service_item
    |> ServiceItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ServiceItem.

  ## Examples

      iex> delete_service_item(service_item)
      {:ok, %ServiceItem{}}

      iex> delete_service_item(service_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_service_item(%ServiceItem{} = service_item) do
    Repo.delete(service_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service_item changes.

  ## Examples

      iex> change_service_item(service_item)
      %Ecto.Changeset{source: %ServiceItem{}}

  """
  def change_service_item(%ServiceItem{} = service_item) do
    ServiceItem.changeset(service_item, %{})
  end
end
