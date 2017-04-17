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

  def go_ahead(probe) do
    case probe.dir do
      0 -> %{probe | y: probe.y+1}
      1 -> %{probe | x: probe.x+1}
      2 -> %{probe | y: probe.y-1}
      3 -> %{probe | x: probe.x-1}
    end
  end

  def move(probe, movement) do
    case movement do
      'L' -> turn_left(probe)
      'R' -> turn_right(probe)
      'M' -> go_ahead(probe)
    end
  end

end
