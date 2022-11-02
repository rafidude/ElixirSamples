# Async spawn processes and run queries that sleep for 2 secs.
# Collect the results into a list

run_query =
  fn query_def ->
    Process.sleep(2000)
    "#{query_def} result"
  end

# Run the deliberately delayed query in a separate process
# return the result to the calling process
async_query =
  fn query_def ->
    caller = self()
    spawn(fn ->
  		send(caller, {:query_result, run_query.(query_def)})
	end)
 end

# One by one receive the messages from self's mailbox
get_result =
  fn ->
    receive do
      {:query_result, result} -> result
    end
  end

Enum.each(1..5, &async_query.("query #{&1}"))
results = Enum.map(1..5, fn _ -> get_result.() end)

IO.inspect results
