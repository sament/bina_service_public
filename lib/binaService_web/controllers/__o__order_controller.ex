defmodule BinaServiceWeb.OrderController do
  use BinaServiceWeb, :controller

# A plug for generating a unique request id for each request.

# The generated request id will be in the format "uq8hs30oafhj5vve8ji5pmp7mtopc08f".

# The request id is added to the Logger metadata as :request_id and the response as the "x-request-id" HTTP header. To see the request id in your log output, configure your logger backends to include the :request_id metadata:

# config :logger, :console, metadata: [:request_id]
# It is recommended to include this metadata configuration in your production configuration file.

# To use it, just plug it into the desired module:
  # plug Plug.RequestId

  alias BinaService.Identities
  alias BinaService.Identities.User

  alias BinaService.Sales
  alias BinaService.Sales.Order
  alias BinaService.Sales.Bill

  action_fallback BinaServiceWeb.FallbackController


  def index(conn, _params) do
    orders = Sales.list_orders()
    render(conn, "index.json", orders: orders)
  end

end
