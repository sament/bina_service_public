defmodule BinaService.Guardian do
  use Guardian, otp_app: :binaService


  # Our subject_for_token(resource, _claims) function takes in a resource (user in this case),
  # finds a property/field by which the token will be able to identify that resource (herein user_id, accessed by user.id),
  # and adds it to the token’s claims as “sub”(subject).
  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  # Our resource_from_claims(claims) function gets the “sub” from a token as id,
  # then tries to retrieve the user with that id through Identities.get_user!(id).
  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = BinaService.Identities.get_user!(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
