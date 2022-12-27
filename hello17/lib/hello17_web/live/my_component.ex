defmodule MyComponent do
  use Phoenix.Component

  attr :name, :string, required: true
  def greet(assigns) do
    ~H"""
    <p>Hello, <%= @name %>!</p>
    """
  end

  attr :name, :string, required: true
  attr :age, :integer, required: true

  def celebrate(assigns) do
    ~H"""
    <p>
      Happy birthday <%= @name %>!
      You are <%= @age %> years old.
    </p>
    """
  end

  slot :inner_block, required: true

  def button1(assigns) do
    ~H"""
    <button>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  slot :inner_block, required: true
  attr :entries, :list, default: []
  def unordered_list(assigns) do
    ~H"""
    <ul>
      <%= for entry <- @entries do %>
        <li><%= render_slot(@inner_block, entry) %></li>
      <% end %>
    </ul>
    """
  end

  slot :header
  slot :inner_block, required: true
  slot :footer, required: true

  def modal1(assigns) do
    ~H"""
    <div class="modal">
      <div class="modal-header">
        <%= render_slot(@header) || "Modal" %>
      </div>
      <div class="modal-body">
        <%= render_slot(@inner_block) %>
      </div>
      <div class="modal-footer">
        <%= render_slot(@footer) %>
      </div>
    </div>
    """
  end

end
