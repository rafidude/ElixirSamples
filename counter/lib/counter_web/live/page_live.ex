defmodule CounterWeb.PageLive do
  use CounterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(number: 0)}
  end

  def handle_event("inc", _params, socket) do
    {:noreply, socket |> update(:number, fn num -> num + 1 end)}
  end

  def handle_event("clear", _params, socket) do
    {:noreply, socket |> update(:number, fn _ -> 0 end)}
  end

  def handle_event("dec", _params, socket) do
    {:noreply, socket |> update(:number, fn num -> max(0, num - 1) end)}
  end

end
