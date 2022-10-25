defmodule Issues.GitHub do
  def user_repos(client, login) do
    Tesla.get(client, "/user/" <> login <> "/repos")
  end

  def issues(client) do
    Tesla.get(client, "/issues")
  end

  # build dynamic client based on runtime arguments
  def client(token) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.github.com"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, [{"authorization", "token: " <> token }]},
      {Tesla.Middleware.Headers, [{"user-agent", "Tesla"}]}
    ]

    Tesla.client(middleware)
  end
end
