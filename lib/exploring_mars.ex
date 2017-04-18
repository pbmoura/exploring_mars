defmodule ExploringMars do

  def request_terrain do
    [x,y] = for s <- String.split(IO.gets "terrain top-right coordinate (x y)?") do
      String.to_integer(s)
    end
    %Terrain{x_max: x, y_max: y}
  end

  def request_probe do
    [sx, sy, sd] = String.split(IO.gets "probe position (x y direction)?")
    x = String.to_integer(sx)
    y = String.to_integer(sy)
    d = Probe.Directions.index(sd)
    %Probe.State{x: x, y: y, dir: d}
  end
  def request_route do
    String.graphemes(String.trim(IO.gets "route (sequence of L,M,R)?"))
  end

  def start do
    terrain = request_terrain()
    probe = request_probe()
    route = request_route()
    probe = Probe.travel(probe, route, terrain)
    IO.puts Probe.to_string(probe)
  end
end
