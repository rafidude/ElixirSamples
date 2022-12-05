defmodule Api1Web.Router do
  use Api1Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Api1Web do
    pipe_through :api
    get "/", HelloController, :index
  end
end
