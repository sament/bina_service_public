defmodule BinaService.FinancesTest do
  use BinaService.DataCase

  alias BinaService.Finances

  describe "bills" do
    alias BinaService.Finances.Bill

    @valid_attrs %{amount: 120.5, billing_address: "some billing_address", details: "some details", due_date: "2010-04-17T14:00:00Z", reference_number: "some reference_number", shipping_address: "some shipping_address", status: "some status", tax: 120.5, terms: "some terms"}
    @update_attrs %{amount: 456.7, billing_address: "some updated billing_address", details: "some updated details", due_date: "2011-05-18T15:01:01Z", reference_number: "some updated reference_number", shipping_address: "some updated shipping_address", status: "some updated status", tax: 456.7, terms: "some updated terms"}
    @invalid_attrs %{amount: nil, billing_address: nil, details: nil, due_date: nil, reference_number: nil, shipping_address: nil, status: nil, tax: nil, terms: nil}

    def bill_fixture(attrs \\ %{}) do
      {:ok, bill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Finances.create_bill()

      bill
    end

    test "list_bills/0 returns all bills" do
      bill = bill_fixture()
      assert Finances.list_bills() == [bill]
    end

    test "get_bill!/1 returns the bill with given id" do
      bill = bill_fixture()
      assert Finances.get_bill!(bill.id) == bill
    end

    test "create_bill/1 with valid data creates a bill" do
      assert {:ok, %Bill{} = bill} = Finances.create_bill(@valid_attrs)
      assert bill.amount == 120.5
      assert bill.billing_address == "some billing_address"
      assert bill.details == "some details"
      assert bill.due_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert bill.reference_number == "some reference_number"
      assert bill.shipping_address == "some shipping_address"
      assert bill.status == "some status"
      assert bill.tax == 120.5
      assert bill.terms == "some terms"
    end

    test "create_bill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_bill(@invalid_attrs)
    end

    test "update_bill/2 with valid data updates the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{} = bill} = Finances.update_bill(bill, @update_attrs)
      assert bill.amount == 456.7
      assert bill.billing_address == "some updated billing_address"
      assert bill.details == "some updated details"
      assert bill.due_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert bill.reference_number == "some updated reference_number"
      assert bill.shipping_address == "some updated shipping_address"
      assert bill.status == "some updated status"
      assert bill.tax == 456.7
      assert bill.terms == "some updated terms"
    end

    test "update_bill/2 with invalid data returns error changeset" do
      bill = bill_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_bill(bill, @invalid_attrs)
      assert bill == Finances.get_bill!(bill.id)
    end

    test "delete_bill/1 deletes the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{}} = Finances.delete_bill(bill)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_bill!(bill.id) end
    end

    test "change_bill/1 returns a bill changeset" do
      bill = bill_fixture()
      assert %Ecto.Changeset{} = Finances.change_bill(bill)
    end
  end

  describe "payments" do
    alias BinaService.Finances.Payment

    @valid_attrs %{amount: 120.5, reference_number: "some reference_number", status: "some status"}
    @update_attrs %{amount: 456.7, reference_number: "some updated reference_number", status: "some updated status"}
    @invalid_attrs %{amount: nil, reference_number: nil, status: nil}

    def payment_fixture(attrs \\ %{}) do
      {:ok, payment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Finances.create_payment()

      payment
    end

    test "list_payments/0 returns all payments" do
      payment = payment_fixture()
      assert Finances.list_payments() == [payment]
    end

    test "get_payment!/1 returns the payment with given id" do
      payment = payment_fixture()
      assert Finances.get_payment!(payment.id) == payment
    end

    test "create_payment/1 with valid data creates a payment" do
      assert {:ok, %Payment{} = payment} = Finances.create_payment(@valid_attrs)
      assert payment.amount == 120.5
      assert payment.reference_number == "some reference_number"
      assert payment.status == "some status"
    end

    test "create_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_payment(@invalid_attrs)
    end

    test "update_payment/2 with valid data updates the payment" do
      payment = payment_fixture()
      assert {:ok, %Payment{} = payment} = Finances.update_payment(payment, @update_attrs)
      assert payment.amount == 456.7
      assert payment.reference_number == "some updated reference_number"
      assert payment.status == "some updated status"
    end

    test "update_payment/2 with invalid data returns error changeset" do
      payment = payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_payment(payment, @invalid_attrs)
      assert payment == Finances.get_payment!(payment.id)
    end

    test "delete_payment/1 deletes the payment" do
      payment = payment_fixture()
      assert {:ok, %Payment{}} = Finances.delete_payment(payment)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_payment!(payment.id) end
    end

    test "change_payment/1 returns a payment changeset" do
      payment = payment_fixture()
      assert %Ecto.Changeset{} = Finances.change_payment(payment)
    end
  end
end
