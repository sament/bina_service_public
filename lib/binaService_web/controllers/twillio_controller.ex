defmodule BinaServiceWeb.TwillioController do
  use BinaServiceWeb, :controller


alias BinaService.Identities
alias BinaService.Identities.User

alias ExTwilio
# before https://timberwolf-mastiff-9776.twil.io/demo-reply

# Allows users interact via voice or sms when placing order or interacting with Bina.


def handle_bot(conn, params) do

[_|to] = params["To"] |> String.split(":")
[_|from] = params["From"]  |> String.split(":")

to = to_string to
 from = to_string from

  # render(conn, "index.json", response: %{name: "Sam", g: 7.2})
  #works
  ExTwilio.Message.create([
    From: "+14846536603", #to,
    To: from,
    Body: "Your message was recieved at server!"
  ])
end
def handle_hook(conn, params) do

  # %{"AccountSid" => "ACad37fc3c115c79be9b73fc4f62535aef", "ApiVersion" => "2010-04-01", "ChannelInstallSid" => "XE34bab3379371a3f904e6224370f07620",
  #  "ChannelPrefix" => "whatsapp", "ChannelToAddress" => "+2348029056826", "EventType" => "DELIVERED",
  #   "From" => "whatsapp:+14155238886", "MessageSid" => "SMf6edb794d7bf0db5f1620ecf0439de8e", "MessageStatus" => "delivered",
  # "SmsSid" => "SMf6edb794d7bf0db5f1620ecf0439de8e", "SmsStatus" => "delivered", "To" => "whatsapp:+2348029056826"}
  # params |> IO.inspect
  # users = Identities.list_users()

render("index.json", %{data: %{name: "Sam"}})



end

end


# POST /api/v1/webhooks/twillio
# [debug] Processing with BinaServiceWeb.TwillioController.handle_hook/2
#   Parameters: %{"AccountSid" => "ACad37fc3c115c79be9b73fc4f62535aef", "ApiVersion" => "2010-04-01", "Body" => "Halos", "From" => "whatsapp:+2348183490504", "MessageSid" => "SM6a3e9bf3cfd22298ca3cae0742baad13", "NumMedia" => "0", "NumSegments" => "1", "SmsMessageSid" => "SM6a3e9bf3cfd22298ca3cae0742baad13", "SmsSid" => "SM6a3e9bf3cfd22298ca3cae0742baad13", "SmsStatus" => "received", "To" => "whatsapp:+14155238886"}
#   Pipelines: [:api]
# %{
#   "AccountSid" => "ACad37fc3c115c79be9b73fc4f62535aef",
#   "ApiVersion" => "2010-04-01",
#   "Body" => "Halos",
#   "From" => "whatsapp:+2348183490504",
#   "MessageSid" => "SM6a3e9bf3cfd22298ca3cae0742baad13",
#   "NumMedia" => "0",
#   "NumSegments" => "1",
#   "SmsMessageSid" => "SM6a3e9bf3cfd22298ca3cae0742baad13",
#   "SmsSid" => "SM6a3e9bf3cfd22298ca3cae0742baad13",
#   "SmsStatus" => "received",
#   "To" => "whatsapp:+14155238886"
# }
# [info] Sent 200 in 731ms

# %{"AccountSid" => "ACad37fc3c115c79be9b73fc4f62535aef", "ApiVersion" => "2010-04-01", "Body" => "New order tech",
#  "From" => "whatsapp:+2348029056826", "MessageSid" => "SMc7332d7bffb33b2de0c46399d77b3405",
#   "NumMedia" => "0", "NumSegments" => "1", "SmsMessageSid" => "SMc7332d7bffb33b2de0c46399d77b3405",
#  "SmsSid" => "SMc7332d7bffb33b2de0c46399d77b3405", "SmsStatus" => "received", "To" => "whatsapp:+14155238886"}

# [_|to] = p["To"] |> String.split(":")
