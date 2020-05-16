defmodule  Bina.SM do


  Consumer{user_uuid, name}  <=  [Service.Consumers]
Provider|ServiceProvider {user_uuid, name}  <=  [Service.Providers]
Services {owner_uuid, name, %tags{}, description, %details{description,thumbnail...}}   <=  [Service]
Orders {uuid, %consumer{}, created_at, %when(from_date, to_date), %where{%address{}}, %order_events[timestamp, %status]}

Invoice{uuid,order_uuid, total, %line_items[], %payment_events[%payment{},timestamp, %status] }
Payments{uuid, invoice_uuid, from_account_uuid, to_account_uuid}
Accounts{uuid, class_account_uuid, name, opening_balance, current_balance}

User {uuid, handle, %login_details{}, created_at}  <=  [Identity.Security]
Profile {uuid, %profile_details{%profile_photos{}, email, phone, %home_address{}, %scoring{loyalty}}}   <=  [Identity.Profiles]


COMMANDS {_transaction_id, timestamp} in every command internally used
so that
def command(transaction_id, timestamp) do
  command_atom{COMMAND.name,
  outer_id: transaction_id,
  time: timestamp
}
|> Repo.insert
end

def insert_command(%CommandAtom{}=command_atom) do
  Repo.insert (command_atom)
end



login{%login_details{}, %login_method}
register_user {%user{}}
create_user_account{%user, %account} => %Account{}
profile_user{%user, %profile{}}
create_service{%provider, %service{}} ==>  %Order{}
Update_Service {
                request_service{%service, %requests}
                accept_service{%serviceprovider, %order_event{ACCEPTED}}
                reject_service{%serviceprovider, %order_event{REJECTED}}
                cancel_service{%serviceprovider, %order_event{CANCELLED}}
                confirm_service{%serviceprovider, %order_event{CONFIRMED}}

              } ==> %Order{}  #They all return an updated Order state

generate_invoice{%order, total, %line_items[] %} ==> %Invoice{}
pay_invoice{%invoice, amount} ==> %Invoice{%payment_events{%payment{%from_consumer, %to_provider, amount}, PARTIAL/FULL}}


# In the future create the BinaFramework that allows devs use the BinaStructure to impliment their data. DO it for NodeJS community, ELixir, PHP
# simply pass actors and their events, bina handles orm and db. A library for developers to use the BinaFramework.


# Bina is an acrhitecture for digitizing business. Business architecture/framework.
# BINA
# [Business Framework]
end
