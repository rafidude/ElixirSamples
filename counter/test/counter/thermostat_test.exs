defmodule Counter.ThermostatTest do
  use ExUnit.Case, async: true
  alias Counter.Thermostat

  test "setup increment and decrement functionality" do
    assert Thermostat.value() == 0

    Thermostat.inc_temperature()
    assert Thermostat.value() == 1
    Thermostat.dec_temperature()
    assert Thermostat.value() == 0
  end
end
