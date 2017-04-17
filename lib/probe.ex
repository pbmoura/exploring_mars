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
end
