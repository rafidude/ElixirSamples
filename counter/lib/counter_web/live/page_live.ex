defmodule CounterWeb.PageLive do
  use CounterWeb, :live_view
  alias Counter.Counter

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(number: Counter.value())}
  end

  def handle_event("inc", _params, socket) do
    Counter.increment()
    {:noreply, socket |> update(:number, fn _ -> Counter.value() end)}
  end

  def handle_event("dec", _params, socket) do
    Counter.decrement()
    {:noreply, socket |> update(:number, fn _ -> Counter.value() end)}
  end

end
