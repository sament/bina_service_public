defmodule BinaService.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :BinaService,
  module: BinaService.Guardian,
  error_handler: BinaService.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
