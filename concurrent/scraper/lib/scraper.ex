defmodule Scraper do
  # process that sleeps from one to five seconds at random
  def work() do
    # For simplicity, this function is
    # just a placeholder and does not contain # real scraping logic.
    1..5
    |> Enum.random()
    |> :timer.seconds()
    |> Process.sleep()
  end
end
