defmodule CounterWeb.ListCounterLive do
  use CounterWeb, :live_view
  alias Counter.ListCounter

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(number_list: ListCounter.value())}
  end

  def handle_event("inc", %{"id" => id}, socket) do
    ListCounter.increment(id)
    {:noreply, socket |> update(:number_list, fn _ -> ListCounter.value() end)}
  end

  def handle_event("dec",  %{"id" => id}, socket) do
    ListCounter.decrement(id)
    {:noreply, socket |> update(:number_list, fn _ -> ListCounter.value() end)}
  end

end
