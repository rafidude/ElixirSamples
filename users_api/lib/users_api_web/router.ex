defmodule UsersApiWeb.Router do
  use UsersApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UsersApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
