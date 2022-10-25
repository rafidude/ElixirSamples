defmodule Chirp.Timeline do
  import Ecto.Query, warn: false
  alias Chirp.Repo

  alias Chirp.Timeline.Post

  def list_posts do
    Repo.all(from p in Post, order_by: [desc: p.id])
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:post_created)
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
    |> broadcast(:post_updated)
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Chirp.PubSub, "posts")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, post}, event) do
    Phoenix.PubSub.broadcast(Chirp.PubSub, "posts", {event, post})
    {:ok, post}
  end

  def inc_likes(%Post{id: id}) do
    {1, [post]} =
        from(p in Post, where: p.id == ^id, select: p)
        |> Repo.update_all(inc: [likes_count: 1])
    broadcast({:ok, post}, :post_updated)
  end

  def inc_reposts(%Post{id: id}) do
    {1, [post]} =
        from(p in Post, where: p.id == ^id, select: p)
        |> Repo.update_all(inc: [reposts_count: 1])
    broadcast({:ok, post}, :post_updated)
  end
end
