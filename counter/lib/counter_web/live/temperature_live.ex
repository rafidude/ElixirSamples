defmodule CounterWeb.TemperatureLive do
  use CounterWeb, :live_view
  alias Counter.Thermostat

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(temperature: Thermostat.value())}
  end

  def handle_event("update_temp", %{"key" => "ArrowUp"}, socket) do
    Thermostat.inc_temperature()
    {:noreply, socket |> update(:temperature, fn _ -> Thermostat.value() end)}
  end

  def handle_event("update_temp", %{"key" => "ArrowDown"}, socket) do
    Thermostat.dec_temperature()
    {:noreply, socket |> update(:temperature, fn _ -> Thermostat.value() end)}
  end

  def handle_event("update_temp", _, socket) do
    {:noreply, socket}
  end

end
