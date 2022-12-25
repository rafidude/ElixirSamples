defmodule MyComponent do
  use Phoenix.Component

  def greet(assigns) do
    ~H"""
    <p>Hello, <%= @name %>!</p>
    """
  end

  def button(assigns) do
    ~H"""
    <button class="btn">
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  def unordered_list(assigns) do
    ~H"""
    <ul>
      <%= for entry <- @entries do %>
        <li><%= render_slot(@inner_block, entry) %></li>
      <% end %>
    </ul>
    """
  end
  def modal(assigns) do
    ~H"""
    <div class="modal">
      <div class="modal-header">
        <%= render_slot(@header) %>
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
  def table(assigns) do
    ~H"""
    <table>
      <tr>
        <%= for col <- @col do %>
          <th><%= col.label %></th>
        <% end %>
      </tr>
      <%= for row <- @rows do %>
        <tr>
          <%= for col <- @col do %>
            <td><%= render_slot(col, row) %></td>
          <% end %>
        </tr>
      <% end %>
    </table>
    """
  end
end
