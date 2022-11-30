defmodule A do
  use GenStage

  def start_link(number) do
    GenStage.start_link(A, number)
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
    GenStage.start_link(B, multiplier)
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

# {:ok, a} = A.start_link(0)  # starting from zero
# {:ok, b} = B.start_link(2)  # multiply by 2
# {:ok, c} = C.start_link([]) # state does not matter
#
# GenStage.sync_subscribe(c, to: b)
# GenStage.sync_subscribe(b, to: a)

# Let's call the stage in module A as A
# GenStage.start_link(A, 0, name: A)
# Let's call the stage in module B as B
# GenStage.start_link(B, 2, name: B)
# No need to name consumers as they won't be subscribed to
# GenStage.start_link(C, :ok)
# start more consumers by more calls
# GenStage.start_link(C, :ok)
# GenStage.start_link(C, :ok)
# we will no longer need to call sync_subscribe/2.
