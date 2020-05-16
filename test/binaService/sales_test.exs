defmodule BinaService.SalesTest do
  use BinaService.DataCase

  alias BinaService.Sales

  describe "consumers" do
    alias BinaService.Sales.Consumer

    @valid_attrs %{name: "some name", tags: "some tags"}
    @update_attrs %{name: "some updated name", tags: "some updated tags"}
    @invalid_attrs %{name: nil, tags: nil}

    def consumer_fixture(attrs \\ %{}) do
      {:ok, consumer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_consumer()

      consumer
    end

    test "list_consumers/0 returns all consumers" do
      consumer = consumer_fixture()
      assert Sales.list_consumers() == [consumer]
    end

    test "get_consumer!/1 returns the consumer with given id" do
      consumer = consumer_fixture()
      assert Sales.get_consumer!(consumer.id) == consumer
    end

    test "create_consumer/1 with valid data creates a consumer" do
      assert {:ok, %Consumer{} = consumer} = Sales.create_consumer(@valid_attrs)
      assert consumer.name == "some name"
      assert consumer.tags == "some tags"
    end

    test "create_consumer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_consumer(@invalid_attrs)
    end

    test "update_consumer/2 with valid data updates the consumer" do
      consumer = consumer_fixture()
      assert {:ok, %Consumer{} = consumer} = Sales.update_consumer(consumer, @update_attrs)
      assert consumer.name == "some updated name"
      assert consumer.tags == "some updated tags"
    end

    test "update_consumer/2 with invalid data returns error changeset" do
      consumer = consumer_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_consumer(consumer, @invalid_attrs)
      assert consumer == Sales.get_consumer!(consumer.id)
    end

    test "delete_consumer/1 deletes the consumer" do
      consumer = consumer_fixture()
      assert {:ok, %Consumer{}} = Sales.delete_consumer(consumer)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_consumer!(consumer.id) end
    end

    test "change_consumer/1 returns a consumer changeset" do
      consumer = consumer_fixture()
      assert %Ecto.Changeset{} = Sales.change_consumer(consumer)
    end
  end

  describe "providers" do
    alias BinaService.Sales.Provider

    @valid_attrs %{name: "some name", tags: "some tags"}
    @update_attrs %{name: "some updated name", tags: "some updated tags"}
    @invalid_attrs %{name: nil, tags: nil}

    def provider_fixture(attrs \\ %{}) do
      {:ok, provider} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_provider()

      provider
    end

    test "list_providers/0 returns all providers" do
      provider = provider_fixture()
      assert Sales.list_providers() == [provider]
    end

    test "get_provider!/1 returns the provider with given id" do
      provider = provider_fixture()
      assert Sales.get_provider!(provider.id) == provider
    end

    test "create_provider/1 with valid data creates a provider" do
      assert {:ok, %Provider{} = provider} = Sales.create_provider(@valid_attrs)
      assert provider.name == "some name"
      assert provider.tags == "some tags"
    end

    test "create_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_provider(@invalid_attrs)
    end

    test "update_provider/2 with valid data updates the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{} = provider} = Sales.update_provider(provider, @update_attrs)
      assert provider.name == "some updated name"
      assert provider.tags == "some updated tags"
    end

    test "update_provider/2 with invalid data returns error changeset" do
      provider = provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_provider(provider, @invalid_attrs)
      assert provider == Sales.get_provider!(provider.id)
    end

    test "delete_provider/1 deletes the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{}} = Sales.delete_provider(provider)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_provider!(provider.id) end
    end

    test "change_provider/1 returns a provider changeset" do
      provider = provider_fixture()
      assert %Ecto.Changeset{} = Sales.change_provider(provider)
    end
  end

  describe "services" do
    alias BinaService.Sales.Service

    @valid_attrs %{description: "some description", details: "some details", name: "some name", tags: "some tags"}
    @update_attrs %{description: "some updated description", details: "some updated details", name: "some updated name", tags: "some updated tags"}
    @invalid_attrs %{description: nil, details: nil, name: nil, tags: nil}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Sales.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Sales.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = service} = Sales.create_service(@valid_attrs)
      assert service.description == "some description"
      assert service.details == "some details"
      assert service.name == "some name"
      assert service.tags == "some tags"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, %Service{} = service} = Sales.update_service(service, @update_attrs)
      assert service.description == "some updated description"
      assert service.details == "some updated details"
      assert service.name == "some updated name"
      assert service.tags == "some updated tags"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_service(service, @invalid_attrs)
      assert service == Sales.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Sales.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Sales.change_service(service)
    end
  end

  describe "services" do
    alias BinaService.Sales.Service

    @valid_attrs %{description: "some description", details: "some details", name: "some name", slots: 42, tags: "some tags"}
    @update_attrs %{description: "some updated description", details: "some updated details", name: "some updated name", slots: 43, tags: "some updated tags"}
    @invalid_attrs %{description: nil, details: nil, name: nil, slots: nil, tags: nil}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Sales.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Sales.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = service} = Sales.create_service(@valid_attrs)
      assert service.description == "some description"
      assert service.details == "some details"
      assert service.name == "some name"
      assert service.slots == 42
      assert service.tags == "some tags"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, %Service{} = service} = Sales.update_service(service, @update_attrs)
      assert service.description == "some updated description"
      assert service.details == "some updated details"
      assert service.name == "some updated name"
      assert service.slots == 43
      assert service.tags == "some updated tags"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_service(service, @invalid_attrs)
      assert service == Sales.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Sales.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Sales.change_service(service)
    end
  end

  describe "orders" do
    alias BinaService.Sales.Order

    @valid_attrs %{destination_address: "some destination_address", period_end: "2010-04-17T14:00:00Z", period_start: "2010-04-17T14:00:00Z", status: "some status"}
    @update_attrs %{destination_address: "some updated destination_address", period_end: "2011-05-18T15:01:01Z", period_start: "2011-05-18T15:01:01Z", status: "some updated status"}
    @invalid_attrs %{destination_address: nil, period_end: nil, period_start: nil, status: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Sales.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Sales.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Sales.create_order(@valid_attrs)
      assert order.destination_address == "some destination_address"
      assert order.period_end == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert order.period_start == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert order.status == "some status"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Sales.update_order(order, @update_attrs)
      assert order.destination_address == "some updated destination_address"
      assert order.period_end == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert order.period_start == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert order.status == "some updated status"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_order(order, @invalid_attrs)
      assert order == Sales.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Sales.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Sales.change_order(order)
    end
  end

  describe "order_events" do
    alias BinaService.Sales.OrderEvent

    @valid_attrs %{action: "some action", message: "some message", meta: "some meta", status: "some status", timestamp: "2010-04-17T14:00:00Z"}
    @update_attrs %{action: "some updated action", message: "some updated message", meta: "some updated meta", status: "some updated status", timestamp: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{action: nil, message: nil, meta: nil, status: nil, timestamp: nil}

    def order_event_fixture(attrs \\ %{}) do
      {:ok, order_event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_order_event()

      order_event
    end

    test "list_order_events/0 returns all order_events" do
      order_event = order_event_fixture()
      assert Sales.list_order_events() == [order_event]
    end

    test "get_order_event!/1 returns the order_event with given id" do
      order_event = order_event_fixture()
      assert Sales.get_order_event!(order_event.id) == order_event
    end

    test "create_order_event/1 with valid data creates a order_event" do
      assert {:ok, %OrderEvent{} = order_event} = Sales.create_order_event(@valid_attrs)
      assert order_event.action == "some action"
      assert order_event.message == "some message"
      assert order_event.meta == "some meta"
      assert order_event.status == "some status"
      assert order_event.timestamp == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_order_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_order_event(@invalid_attrs)
    end

    test "update_order_event/2 with valid data updates the order_event" do
      order_event = order_event_fixture()
      assert {:ok, %OrderEvent{} = order_event} = Sales.update_order_event(order_event, @update_attrs)
      assert order_event.action == "some updated action"
      assert order_event.message == "some updated message"
      assert order_event.meta == "some updated meta"
      assert order_event.status == "some updated status"
      assert order_event.timestamp == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_order_event/2 with invalid data returns error changeset" do
      order_event = order_event_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_order_event(order_event, @invalid_attrs)
      assert order_event == Sales.get_order_event!(order_event.id)
    end

    test "delete_order_event/1 deletes the order_event" do
      order_event = order_event_fixture()
      assert {:ok, %OrderEvent{}} = Sales.delete_order_event(order_event)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_order_event!(order_event.id) end
    end

    test "change_order_event/1 returns a order_event changeset" do
      order_event = order_event_fixture()
      assert %Ecto.Changeset{} = Sales.change_order_event(order_event)
    end
  end

  describe "items" do
    alias BinaService.Sales.Item

    @valid_attrs %{attributes: "some attributes", description: "some description", name: "some name", status: "some status", uom: "some uom"}
    @update_attrs %{attributes: "some updated attributes", description: "some updated description", name: "some updated name", status: "some updated status", uom: "some updated uom"}
    @invalid_attrs %{attributes: nil, description: nil, name: nil, status: nil, uom: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Sales.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Sales.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Sales.create_item(@valid_attrs)
      assert item.attributes == "some attributes"
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.status == "some status"
      assert item.uom == "some uom"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Sales.update_item(item, @update_attrs)
      assert item.attributes == "some updated attributes"
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.status == "some updated status"
      assert item.uom == "some updated uom"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_item(item, @invalid_attrs)
      assert item == Sales.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Sales.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Sales.change_item(item)
    end
  end

  describe "service_items" do
    alias BinaService.Sales.ServiceItem

    @valid_attrs %{description: "some description", meta: "some meta", qty: 120.5, uom: "some uom"}
    @update_attrs %{description: "some updated description", meta: "some updated meta", qty: 456.7, uom: "some updated uom"}
    @invalid_attrs %{description: nil, meta: nil, qty: nil, uom: nil}

    def service_item_fixture(attrs \\ %{}) do
      {:ok, service_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_service_item()

      service_item
    end

    test "list_service_items/0 returns all service_items" do
      service_item = service_item_fixture()
      assert Sales.list_service_items() == [service_item]
    end

    test "get_service_item!/1 returns the service_item with given id" do
      service_item = service_item_fixture()
      assert Sales.get_service_item!(service_item.id) == service_item
    end

    test "create_service_item/1 with valid data creates a service_item" do
      assert {:ok, %ServiceItem{} = service_item} = Sales.create_service_item(@valid_attrs)
      assert service_item.description == "some description"
      assert service_item.meta == "some meta"
      assert service_item.qty == 120.5
      assert service_item.uom == "some uom"
    end

    test "create_service_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_service_item(@invalid_attrs)
    end

    test "update_service_item/2 with valid data updates the service_item" do
      service_item = service_item_fixture()
      assert {:ok, %ServiceItem{} = service_item} = Sales.update_service_item(service_item, @update_attrs)
      assert service_item.description == "some updated description"
      assert service_item.meta == "some updated meta"
      assert service_item.qty == 456.7
      assert service_item.uom == "some updated uom"
    end

    test "update_service_item/2 with invalid data returns error changeset" do
      service_item = service_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_service_item(service_item, @invalid_attrs)
      assert service_item == Sales.get_service_item!(service_item.id)
    end

    test "delete_service_item/1 deletes the service_item" do
      service_item = service_item_fixture()
      assert {:ok, %ServiceItem{}} = Sales.delete_service_item(service_item)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_service_item!(service_item.id) end
    end

    test "change_service_item/1 returns a service_item changeset" do
      service_item = service_item_fixture()
      assert %Ecto.Changeset{} = Sales.change_service_item(service_item)
    end
  end
end
