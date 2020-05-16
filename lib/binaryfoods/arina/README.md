Codes here will help map keywords to Bina Function

a = %{keywords: ["order","request"], function: nil, payload:["payload1", "payload 2"]}
%{function: nil, keywords: ["order", "request"], payload:["payload1", "payload 2"]}

#Will i have to make 

iex(9)> order1 = %{id: 1, consumer: "sam", provider: "jane", 
requests:[%{ref:"shoes",unit: 2, due_date: DateTime.add(DateTime.utc_now, 432000, :second), 
            delivery:["date","address"]}, 
%{ref: "bags", unit: 1}]

Order.request{ref: "shoes"...}
Order.response{request_ref: "shoes", }
Consumers makes order to Providers indicating their list of requests for that order. one request can be a product or service.
(For now don't let users change the fields..No dynamic field till we discover it really is a need by testing users)

Each request in an %Order{} is parsed to %Task{} ..(which means it must have id(for reference) and due_date
EventCube.Task is an %Event. Use Bina.EventCube.Event/Task?
Task can be seen as a command that will raise future event.
Command/Task>Event

Predefine basic cross-functional-unit events. e.g Finance.Payment.add => emits PaymentMade
:account_opened, :provider_added, :payment_made
:accepted, :countered, :rejected,
:checked_in, :checked_out, :joined, :left
:message_delivered

%Order.Request.Extension(key, value) #helps input dynamic fields into an Order.Request map

def handle_call("pid")

case response.status do
    {:accepted, order} ->#merchant accepts that particluar request order#untill all response.status returns {:accepted, _} an order has not been completed
    {:countered, new_order} -> #merchants puts a counter-offer with new order.request state
    {:rejected, reason} -> #merchant rejects offer with reason
end

def handle_call(:accepted, order) do
def handle_call(:countered, order) do
def handle_call(:rejected, order) do



***BINA || Bina 

Schedule orders(what binaryfoods uses to schedule order) with vendors (event cube helps schedule by accepting)
Recieve service orders through (WhatsApp>>WebApp>>SlackBot)
Make Payments for Orders
Analytics for Cost via CostBaba

Bina passes orders to EventCube to convert to schedule. 
A schedule is simply a Task(funct, payload, execute_on_datetime)
EventCube handles executing tasks like placing orders, responding to order, making payments etc easy for devs.
[EventCube is given the source of payload to execute future task. The payload it passes to functions(your task function)] #Task(funct, payload, execute_on_datetime)


%EventCube {
    worker_pid: #Ref to live process handling this instance of EventCube
     
}

Therefore a contract has to be established which defines the location and neccesary credentials?
Keep it simple: On setting schedule all payload are immutable. How do we handle a change in cost price? Don't we have to check for new price?
How do we decide where to put this logic? How do we start little while also not complicating future mantainance?

With %Schedule{} == schedule <- request |> EventCube.new #abstraction
new_schedule = EventCube.new(request)


defmodule Sales.VendorManager do
    use GenServer #for concurenccy
    add_vendor(vendor) #registers vendor and returns {:ok, id}
end

A Peer-To-Peer chat system=ish experience.
no client/server?
Chat systems has been around since even before the modern Internet came into
existence. Today there are a variety of chat systems of varying complexity. Most of
these chat systems require that a user creates an account to be used with the
provided service. do we sign up when we want to buy something? we just buy.
However, for online service, as we cannot see the Provider we need to trust the provider.
Therefore signing in and KYC compliance etc.
How do we reduce onboarding and adoption bottle neck? How do we reduce friction in trading and services?
From the way I see things this system is better suited to Service providers and consumers than to Product's

The following points are a few of the drawbacks
that the classic client/server model suffer from:
• It has a single point of failure. Essentially this means that if the server goes down
the service is not able to function properly if it is even able to function at all.
• The server need to serve a possibly high amount of work because all requests in the
system is directed to the server, so the load of the server is high.

You don't need to register? Just use WhatsApp as send join.
Just text Join.. we will fetch your name and ids and verify you with our API
(if your phone number is not in community list we will reject it. So that joining is by invitation onlhy)

Help your business communicate through whatsApp...while also tapping into the vast opportunities out there with those in the system.


Recall VISION: Serendpity for XXX million people
niches: food >>SMEs>>fintech  , Verticals: agriculture>>fashion








CUT THE NOISE
We can build an Eyes for company... read data from sources and help you sort them through channels e.g WhatsApp and co.
How can TechPoint value Bina//BinaryFoods? 
