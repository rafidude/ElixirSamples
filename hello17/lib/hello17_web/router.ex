defmodule Hello17Web.Router do
  use Hello17Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Hello17Web.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hello17Web do
    pipe_through :browser

    get "/", PageController, :home
    live "/counter", PageLive
    live "/light", LightLive
    live "/clock", ClockLive

    live "/todo_items", TodoItemLive.Index, :index
    live "/todo_items/new", TodoItemLive.Index, :new
    live "/todo_items/:id/edit", TodoItemLive.Index, :edit

    live "/todo_items/:id", TodoItemLive.Show, :show
    live "/todo_items/:id/show/edit", TodoItemLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hello17Web do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hello17, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: Hello17Web.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
