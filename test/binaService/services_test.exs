defmodule BinaService.ServicesTest do
  use BinaService.DataCase

  alias BinaService.Services

  describe "items" do
    alias BinaService.Services.Item

    @valid_attrs %{attributes: "some attributes", description: "some description", name: "some name", status: "some status", uom: "some uom"}
    @update_attrs %{attributes: "some updated attributes", description: "some updated description", name: "some updated name", status: "some updated status", uom: "some updated uom"}
    @invalid_attrs %{attributes: nil, description: nil, name: nil, status: nil, uom: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Services.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Services.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Services.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Services.create_item(@valid_attrs)
      assert item.attributes == "some attributes"
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.status == "some status"
      assert item.uom == "some uom"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Services.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Services.update_item(item, @update_attrs)
      assert item.attributes == "some updated attributes"
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.status == "some updated status"
      assert item.uom == "some updated uom"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Services.update_item(item, @invalid_attrs)
      assert item == Services.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Services.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Services.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Services.change_item(item)
    end
  end
end
