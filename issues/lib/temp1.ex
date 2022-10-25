defmodule ExampleApi do
  use Tesla, only: [:get], docs: false
  adapter Tesla.Adapter.Hackney

  plug Tesla.Middleware.BaseUrl, "http://api.example.com"
  plug Tesla.Middleware.JSON

  def fetch_data do
    get("/data")
  end
end
