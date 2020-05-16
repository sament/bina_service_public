defmodule BinaService.IdentitiesTest do
  use BinaService.DataCase

  alias BinaService.Identities

  describe "users" do
    alias BinaService.Identities.User

    @valid_attrs %{email: "some email", password_hash: "some password_hash", username: "some username"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash", username: "some updated username"}
    @invalid_attrs %{email: nil, password_hash: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identities.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Identities.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Identities.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Identities.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Identities.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_user(user, @invalid_attrs)
      assert user == Identities.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Identities.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Identities.change_user(user)
    end
  end

  describe "profiles" do
    alias BinaService.Identities.Profile

    @valid_attrs %{dob: ~D[2010-04-17], first_name: "some first_name", gender: "some gender", home_address: "some home_address", last_name: "some last_name", middle_name: "some middle_name", phone: "some phone", profile_details: "some profile_details", profile_url: "some profile_url"}
    @update_attrs %{dob: ~D[2011-05-18], first_name: "some updated first_name", gender: "some updated gender", home_address: "some updated home_address", last_name: "some updated last_name", middle_name: "some updated middle_name", phone: "some updated phone", profile_details: "some updated profile_details", profile_url: "some updated profile_url"}
    @invalid_attrs %{dob: nil, first_name: nil, gender: nil, home_address: nil, last_name: nil, middle_name: nil, phone: nil, profile_details: nil, profile_url: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identities.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Identities.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Identities.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Identities.create_profile(@valid_attrs)
      assert profile.dob == ~D[2010-04-17]
      assert profile.first_name == "some first_name"
      assert profile.gender == "some gender"
      assert profile.home_address == "some home_address"
      assert profile.last_name == "some last_name"
      assert profile.middle_name == "some middle_name"
      assert profile.phone == "some phone"
      assert profile.profile_details == "some profile_details"
      assert profile.profile_url == "some profile_url"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{} = profile} = Identities.update_profile(profile, @update_attrs)
      assert profile.dob == ~D[2011-05-18]
      assert profile.first_name == "some updated first_name"
      assert profile.gender == "some updated gender"
      assert profile.home_address == "some updated home_address"
      assert profile.last_name == "some updated last_name"
      assert profile.middle_name == "some updated middle_name"
      assert profile.phone == "some updated phone"
      assert profile.profile_details == "some updated profile_details"
      assert profile.profile_url == "some updated profile_url"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_profile(profile, @invalid_attrs)
      assert profile == Identities.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Identities.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Identities.change_profile(profile)
    end
  end

  describe "users" do
    alias BinaService.Identities.User

    @valid_attrs %{email: "some email", password_hash: "some password_hash", phone: "some phone", username: "some username"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash", phone: "some updated phone", username: "some updated username"}
    @invalid_attrs %{email: nil, password_hash: nil, phone: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identities.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Identities.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Identities.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Identities.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
      assert user.phone == "some phone"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Identities.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
      assert user.phone == "some updated phone"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_user(user, @invalid_attrs)
      assert user == Identities.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Identities.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Identities.change_user(user)
    end
  end

  describe "profiles" do
    alias BinaService.Identities.Profile

    @valid_attrs %{dob: ~D[2010-04-17], first_name: "some first_name", gender: "some gender", home_address: "some home_address", last_name: "some last_name", middle_name: "some middle_name", profile_details: "some profile_details", profile_url: "some profile_url"}
    @update_attrs %{dob: ~D[2011-05-18], first_name: "some updated first_name", gender: "some updated gender", home_address: "some updated home_address", last_name: "some updated last_name", middle_name: "some updated middle_name", profile_details: "some updated profile_details", profile_url: "some updated profile_url"}
    @invalid_attrs %{dob: nil, first_name: nil, gender: nil, home_address: nil, last_name: nil, middle_name: nil, profile_details: nil, profile_url: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identities.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Identities.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Identities.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Identities.create_profile(@valid_attrs)
      assert profile.dob == ~D[2010-04-17]
      assert profile.first_name == "some first_name"
      assert profile.gender == "some gender"
      assert profile.home_address == "some home_address"
      assert profile.last_name == "some last_name"
      assert profile.middle_name == "some middle_name"
      assert profile.profile_details == "some profile_details"
      assert profile.profile_url == "some profile_url"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{} = profile} = Identities.update_profile(profile, @update_attrs)
      assert profile.dob == ~D[2011-05-18]
      assert profile.first_name == "some updated first_name"
      assert profile.gender == "some updated gender"
      assert profile.home_address == "some updated home_address"
      assert profile.last_name == "some updated last_name"
      assert profile.middle_name == "some updated middle_name"
      assert profile.profile_details == "some updated profile_details"
      assert profile.profile_url == "some updated profile_url"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_profile(profile, @invalid_attrs)
      assert profile == Identities.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Identities.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Identities.change_profile(profile)
    end
  end
end
