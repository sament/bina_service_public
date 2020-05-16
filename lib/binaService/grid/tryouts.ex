defmodule BinaService.Actor do
  use Agent


  alias BinaService.Identities.User

  alias BinaService.Sales.Consumer
  alias BinaService.Sales.Provider

  def start(name,  %User{} = user \\ %User{}) do
    Agent.start(fn -> %{name: name, user: user} end, name: name)
  end
end


defmodule BinaService.Grid.Tryouts do

alias BinaService.Actor
alias BinaService.Grid

def run  (grid_name) do

IO.puts "#{grid_name} cargoe supervision grid starting..."
Grid.start_link #|> IO.inspect

# :sys.trace(:"slot-1-1", true)
# :sys.trace(:"slot-2-1", true)



IO.puts "driver: starting Alhaji Sule's Cargo"
{:ok, alh_sule} = Actor.start(:sule)

IO.puts "driver: starting Chivita's Cargo"
{:ok, chivita} = Actor.start(:chivita)


IO.puts "Alhaji: joins #{grid_name} at slot {1,1}"
Grid.join(alh_sule, {1,1}) |> IO.inspect

IO.puts "Chivita: joins  #{grid_name} at slot {2,1}"
Grid.join(chivita, {2,1}) |> IO.inspect

 IO.puts "Alhaji: moves to slot {1,2}"
 Grid.move(alh_sule, {1,2}) |> IO.inspect

 IO.puts "port: search other loaders near {1,1}"
# Grid.nearby({1,1}, 1.5) |> IO.inspect


# IO.puts "Alhaji: device lost power"
# Process.exit(alh_sule, true)

IO.puts "sleep...."
:timer.sleep(500)

IO.puts "***"
IO.puts "HAPPY NEW YEAR 2020!"
IO.puts "  ***THE ARINA***"



# IO.puts "port search {1,1} again"
# Grid.nearby({1,1}, 1.5) |> IO.inspect

# BinaService.Grid.Tryouts.run "TinCan Island"

end



end

defmodule ID3Parser do

  def parse(file_name) do
    case File.read(file_name) do
      {:ok, mp3} ->
         mp3_byte_size = byte_size(mp3) - 128

        << _ :: binary-size(mp3_byte_size), id3_tag :: binary>> = mp3
        << "TAG", title   ::  binary-size(30),
                  artist   ::  binary-size(30),
                  album   ::  binary-size(30),
                  year   ::  binary-size(4),
                  _rest   :: binary >> = id3_tag

                  IO.puts "#{artist} - #{title} (#{album}, #{year})"

                  _ ->
                    IO.puts "Couldn't open #{file_name}"
                end
  end
end
