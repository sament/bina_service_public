defmodule BinaServiceWeb.ProfileView do
  use BinaServiceWeb, :view
  alias BinaServiceWeb.ProfileView

  def render("index.json", %{profiles: profiles}) do
    %{data: render_many(profiles, ProfileView, "profile.json")}
  end

  def render("show.json", %{profile: profile}) do
    %{data: render_one(profile, ProfileView, "profile.json")}
  end

  def render("profile.json", %{profile: profile}) do
    %{id: profile.id,
      dob: profile.dob,
      first_name: profile.first_name,
      gender: profile.gender,
      home_address: profile.home_address,
      last_name: profile.last_name,
      middle_name: profile.middle_name,
      profile_details: profile.profile_details,
      profile_url: profile.profile_url,
      user_id: profile.user_id
    }
  end


end
