defmodule ProbeTest do
  use ExUnit.Case
  doctest Probe

  test "N to W" do
    probe = %Probe.State{}
    probe = Probe.turn_left(probe)
    assert probe == %Probe.State{dir: 3}
  end

  test "E to N" do
    probe = %Probe.State{dir: 1}
    probe = Probe.turn_left(probe)
    assert probe == %Probe.State{}
  end

  test "S to E" do
    probe = %Probe.State{dir: 2}
    probe = Probe.turn_left(probe)
    assert probe == %Probe.State{dir: 1}
  end

  test "W to S" do
    probe = %Probe.State{dir: 3}
    probe = Probe.turn_left(probe)
    assert probe == %Probe.State{dir: 2}
  end



  test "N to E" do
    probe = %Probe.State{}
    probe = Probe.turn_right(probe)
    assert probe == %Probe.State{dir: 1}
  end

  test "E to S" do
    probe = %Probe.State{dir: 1}
    probe = Probe.turn_right(probe)
    assert probe == %Probe.State{dir: 2}
  end

  test "S to W" do
    probe = %Probe.State{dir: 2}
    probe = Probe.turn_right(probe)
    assert probe == %Probe.State{dir: 3}
  end

  test "W to N" do
    probe = %Probe.State{dir: 3}
    probe = Probe.turn_right(probe)
    assert probe == %Probe.State{}
  end


  test "N ahead" do
    probe = %Probe.State{}
    probe = Probe.go_ahead(probe)
    assert probe == %Probe.State{y: 1}
  end

  test "E ahead" do
    probe = %Probe.State{dir: 1}
    probe = Probe.go_ahead(probe)
    assert probe == %Probe.State{dir: 1, x: 1}
  end

  test "S ahead" do
    probe = %Probe.State{dir: 2, y: 1}
    probe = Probe.go_ahead(probe)
    assert probe == %Probe.State{dir: 2}
  end

  test "W ahead" do
    probe = %Probe.State{dir: 3, x: 1}
    probe = Probe.go_ahead(probe)
    assert probe == %Probe.State{dir: 3}
  end

  test "move L" do
    probe = %Probe.State{}
    {probe, _} = Probe.move(probe, "L")
    assert probe == %Probe.State{dir: 3}
  end

  test "move R" do
    probe = %Probe.State{}
    {probe, _} = Probe.move(probe, "R")
    assert probe == %Probe.State{dir: 1}
  end

  test "move M" do
    probe = %Probe.State{}
    {probe, _} = Probe.move(probe, "M")
    assert probe == %Probe.State{y: 1}
  end

  test "N ahead with boundary" do
    probe = %Probe.State{y: 1}
    terrain = %Terrain{}
    {probe, _} = Probe.move(probe, "M", terrain)
    assert probe == %Probe.State{y: 1}
  end

  test "E ahead with boundary" do
    probe = %Probe.State{dir: 1, x: 1}
    terrain = %Terrain{}
    {probe, _} = Probe.move(probe, "M", terrain)
    assert probe == %Probe.State{dir: 1, x: 1}
  end

  test "S ahead with boundary" do
    probe = %Probe.State{dir: 2}
    terrain = %Terrain{}
    {probe, _} = Probe.move(probe, "M", terrain)
    assert probe == %Probe.State{dir: 2}
  end

  test "W ahead with boundary" do
    probe = %Probe.State{dir: 3}
    terrain = %Terrain{}
    {probe, _} = Probe.move(probe, "M", terrain)
    assert probe == %Probe.State{dir: 3}
  end

  test "N index" do
    assert Probe.Directions.index("N") == 0
  end

  test "E index" do
    assert Probe.Directions.index("E") == 1
  end

  test "S index" do
    assert Probe.Directions.index("S") == 2
  end

  test "W index" do
    assert Probe.Directions.index("W") == 3
  end

  test "label of dir: 0" do
    assert Probe.Directions.label(0) == "N"
  end


  test "label of dir: 1" do
    assert Probe.Directions.label(1) == "E"
  end

  test "label of dir: 2" do
    assert Probe.Directions.label(2) == "S"
  end

  test "label of dir: 3" do
    assert Probe.Directions.label(3) == "W"
  end

  test "travel case 1" do
    probe = %Probe.State{x: 1, y: 2, dir: 0}
    terrain = %Terrain{x_max: 5, y_max: 5}
    route = String.graphemes("LMLMLMLMM")
    {probe, _} = Probe.travel(probe, terrain, route)
    assert probe == %Probe.State{x: 1, y: 3, dir: 0}
  end

  test "travel case 2" do
    probe = %Probe.State{x: 3, y: 3, dir: 1}
    terrain = %Terrain{x_max: 5, y_max: 5}
    route = String.graphemes("MMRMMRMRRM")
    {probe, _} = Probe.travel(probe, terrain, route)
    assert probe == %Probe.State{x: 5, y: 1, dir: 1}
  end

  test "(5 1 3) M" do
    probe = %Probe.State{x: 5, y: 1, dir: 3}
    terrain = %Terrain{x_max: 5, y_max: 5}
    {probe, _} = Probe.move(probe, "M", terrain)
    assert probe == %Probe.State{x: 4, y: 1, dir: 3}
  end

  test "put a flag" do
    probe = %Probe.State{x: 1, y: 1, dir: 0}
    terrain = %Terrain{x_max: 2, y_max: 2}
    {_, terrain} = Probe.put_flag(probe, terrain)
    assert terrain == %Terrain{x_max: 2, y_max: 2, flags: [%Flag{x: 1, y: 1}]}
  end

  test "put two flags" do
    probe = %Probe.State{x: 0, y: 1, dir: 0}
    terrain = %Terrain{x_max: 2, y_max: 2}
    {probe, terrain} = Probe.put_flag(probe, terrain)
    probe = %Probe.State{x: 1, y: 1, dir: 0}
    {_, terrain} = Probe.put_flag(probe, terrain)
    assert terrain == %Terrain{x_max: 2, y_max: 2, flags: [%Flag{x: 0, y: 1}, %Flag{x: 1, y: 1}]}
  end

  test "travel and put flag at the end" do
    probe = %Probe.State{x: 1, y: 2, dir: 0}
    terrain = %Terrain{x_max: 5, y_max: 5}
    route = String.graphemes("LMLMLMLMMF")
    {probe, terrain} = Probe.travel(probe, terrain, route)
    assert probe == %Probe.State{x: 1, y: 3, dir: 0}
    assert terrain == %Terrain{x_max: 5, y_max: 5, flags: [%Flag{x: 1, y: 3}]}
  end

  test "travel and put flag at the begin and end" do
    probe = %Probe.State{x: 1, y: 2, dir: 0}
    terrain = %Terrain{x_max: 5, y_max: 5}
    route = String.graphemes("FLMLMLMLMMF")
    {probe, terrain} = Probe.travel(probe, terrain, route)
    assert probe == %Probe.State{x: 1, y: 3, dir: 0}
    assert terrain == %Terrain{x_max: 5, y_max: 5, flags: [%Flag{x: 1, y: 2}, %Flag{x: 1, y: 3}]}
  end

end
