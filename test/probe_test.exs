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
    probe = Probe.move(probe, 'L')
    assert probe == %Probe.State{dir: 3}
  end

  test "move R" do
    probe = %Probe.State{}
    probe = Probe.move(probe, 'R')
    assert probe == %Probe.State{dir: 1}
  end

  test "move M" do
    probe = %Probe.State{}
    probe = Probe.move(probe, 'M')
    assert probe == %Probe.State{y: 1}
  end

  test "N ahead with boundary" do
    probe = %Probe.State{y: 1}
    terrain = %Terrain{}
    probe = Probe.move(probe, 'M', terrain)
    assert probe == %Probe.State{y: 1}
  end

  test "E ahead with boundary" do
    probe = %Probe.State{dir: 1, x: 1}
    terrain = %Terrain{}
    probe = Probe.move(probe, 'M', terrain)
    assert probe == %Probe.State{dir: 1, x: 1}
  end

  test "S ahead with boundary" do
    probe = %Probe.State{dir: 2}
    terrain = %Terrain{}
    probe = Probe.move(probe, 'M', terrain)
    assert probe == %Probe.State{dir: 2}
  end

  test "W ahead with boundary" do
    probe = %Probe.State{dir: 3}
    terrain = %Terrain{}
    probe = Probe.move(probe, 'M', terrain)
    assert probe == %Probe.State{dir: 3}
  end


end
