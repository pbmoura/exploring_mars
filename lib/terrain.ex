defmodule Flag do
  defstruct x: 0, y: 0
end

defmodule Terrain do
  defstruct x_min: 0, y_min: 0, x_max: 1, y_max: 1, flags: []
end
