defmodule LightSwitchWeb.LightLive do
  use Phoenix.LiveView
  import MyComponent

  def mount(_params, _session, socket) do
    socket =
      socket
        |> assign(:light_bulb_status, "off")
        |> assign(:on_button_status, "")
        |> assign(:off_button_status, "disabled")
    {:ok, socket}
  end

  # rendering is moved to light_live.html.heex
  # def render(assigns) do
  #   ~H"""
  #   <h1>Light is <%= @light_bulb_status %>.</h1>
  #   <button phx-click="on" @on_button_status>On</button>
  #   <button phx-click="off" @off_button_status>Off</button>
  #   """
  # end

  def handle_event("on", _value, socket) do
    socket =
      socket
        |> assign(:light_bulb_status, "on")
        |> assign(:on_button_status, "disabled")
        |> assign(:off_button_status, "")
    {:noreply, socket}
  end

  def handle_event("off", _value, socket) do
    socket =
      socket
        |> assign(:light_bulb_status, "off")
        |> assign(:on_button_status, "")
        |> assign(:off_button_status, "disabled")
    {:noreply, socket}
  end
end
