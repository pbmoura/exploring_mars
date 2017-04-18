defmodule ExploringMars do

  def request_terrain do
    [x,y] = for s <- String.split(IO.gets "terrain top-right coordinate (x y)?") do
      String.to_integer(s)
    end
    %Terrain{x_max: x, y_max: y}
  end

  def request_probe do
    input = String.split(IO.gets "probe position (x y direction)?")
    case input do
      [sx, sy, sd] -> {true, %Probe.State{x: String.to_integer(sx), y: String.to_integer(sy), dir: Probe.Directions.index(sd)}}
      _ -> {false, nil}
    end
  end

  def request_route do
    String.graphemes(String.trim(IO.gets "route (sequence of L,M,R)?"))
  end

  def probe_loop(terrain) do
    {continue, probe} = request_probe()
    if continue do
      route = request_route()
      probe = Probe.travel(probe, route, terrain)
      IO.puts Probe.to_string(probe)
      probe_loop(terrain)
    end
  end

  def start do
    terrain = request_terrain()
    probe_loop(terrain)
  end
end
