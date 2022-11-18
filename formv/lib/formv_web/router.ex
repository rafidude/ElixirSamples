defmodule FormvWeb.Router do
  use FormvWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {FormvWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FormvWeb do
    pipe_through :browser

    get "/", PageController, :home
    # live "/", FormvLive
    live "/employees", EmployeeLive.Index, :index
    live "/employees/new", EmployeeLive.Index, :new
    live "/employees/:id/edit", EmployeeLive.Index, :edit

    live "/employees/:id", EmployeeLive.Show, :show
    live "/employees/:id/show/edit", EmployeeLive.Show, :edit

    live "/students", StudentLive.Index, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FormvWeb do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:formv, :dev_routes) do

    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
