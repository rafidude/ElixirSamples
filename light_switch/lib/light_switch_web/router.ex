defmodule LightSwitchWeb.Router do
  use LightSwitchWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LightSwitchWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LightSwitchWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/light", LightLive
    live "/clock", ClockLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LightSwitchWeb do
  #   pipe_through :api
  # end
end
