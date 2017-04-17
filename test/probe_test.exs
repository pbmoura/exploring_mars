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

end
