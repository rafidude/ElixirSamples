defmodule A do
  use GenStage

  def start_link(number) do
    GenStage.start_link(A, number, name: A)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # If the counter is 3 and we ask for 2 items, we will
    # emit the items 3 and 4, and set the state to 5.
    events = Enum.to_list(counter..counter+demand-1)
    {:noreply, events, counter + demand}
  end
end

defmodule B do
  use GenStage

  def start_link(multiplier) do
    GenStage.start_link(B, multiplier, name: B)
  end

  def init(multiplier) do
    # {:producer_consumer, multiplier}
    {:producer_consumer, multiplier, subscribe_to: [{A, max_demand: 10}]}
  end

  def handle_events(events, _from, multiplier) do
    events = Enum.map(events, & &1 * multiplier)
    {:noreply, events, multiplier}
  end
end

defmodule C do
  use GenStage

  def start_link(_opts) do
    GenStage.start_link(C, :ok)
  end

  def init(:ok) do
    # {:consumer, :the_state_does_not_matter}
    {:consumer, :the_state_does_not_matter, subscribe_to: [B]}
  end

  def handle_events(events, _from, state) do
    # Wait for a second.
    Process.sleep(1000)

    # Inspect the events.
    IO.inspect(events)

    # We are a consumer, so we would never emit items.
    {:noreply, [], state}
  end
end
