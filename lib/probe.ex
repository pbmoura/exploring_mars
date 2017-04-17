defmodule Probe.State do
  defstruct x: 0, y: 0, dir: 0
end

defmodule Probe do
  def turn_left(probe) do
    %{probe | dir: if probe.dir == 0 do 3 else probe.dir-1 end}
  end

  def turn_right(probe) do
    %{probe | dir: rem(probe.dir + 1, 4)}
  end

  def go_ahead(probe, terrain \\ nil) do
    case probe.dir do
      0 -> %{probe | y: if !terrain || probe.y < terrain.y_max do probe.y+1 else terrain.y_max end }
      1 -> %{probe | x: if !terrain || probe.x < terrain.x_max do probe.x+1 else terrain.x_max end }
      2 -> %{probe | y: if !terrain || probe.y > terrain.y_min do probe.y-1 else terrain.y_min end }
      3 -> %{probe | x: if !terrain || probe.x < terrain.x_min do probe.x-1 else terrain.x_min end }
    end
  end

  def move(probe, movement, terrain \\ nil) do
    case movement do
      'L' -> turn_left(probe)
      'R' -> turn_right(probe)
      'M' -> go_ahead(probe, terrain)
    end
  end

end
