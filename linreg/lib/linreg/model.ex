defmodule Linreg.Model do
  # m is Slope & b is Y-Intercept
  defstruct m: 0.0, b: 0.0
  alias __MODULE__
  alias Linreg.Data

  def new do
    %Model{}
  end

  # predict y which is mx + b, given Model, x
  def predict(%Model{m: m, b: b}, x) do
    m * x + b
  end


  def derive_model(%Data{points: points}) do
    # calculates slope and yintercept to derive model for y = m * x + c
    # Slope m = Sum( (xi - x.mean) * (yi - y.mean) )  / Sum( (xi - x.mean) **2)
    # Y-Intercept c = y.mean - m * x.mean

    n = Enum.count(points)
    all_x = Enum.map(points, fn {x, _} -> x end)
    all_y = Enum.map(points, fn {_, y} -> y end)
    x_mean = Enum.sum(all_x) / n
    y_mean = Enum.sum(all_y) / n
    xi_minus_xmean_squared = Enum.map(points, fn {x, _} -> (x - x_mean) ** 2.0 end)
    xi_minus_xmean_prod_yi_minus_ymean = Enum.map(points, fn {x, y} -> (x - x_mean) * (y - y_mean) end)
    m = Enum.sum( xi_minus_xmean_prod_yi_minus_ymean ) / Enum.sum( xi_minus_xmean_squared )
    b = y_mean - m * y_mean
    %Model{m: m, b: b}
  end

  def train(%Model{} = model, %Data{points: points}, opts \\ []) do
    learning_rate = Keyword.get(opts, :learning_rate, 0.01)
    epochs = Keyword.get(opts, :epochs, 100)

    for _epoch <- 1..epochs, reduce: model do
      %Model{m: m, b: b} = model ->
        m_error =
          points
          |> Enum.map(fn {x, y} -> x * (predict(model, x) - y) end)
          |> Enum.sum()
          |> Kernel./(length(points))

        b_error =
          points
          |> Enum.map(fn {x, y} -> predict(model, x) - y end)
          |> Enum.sum()
          |> Kernel./(length(points))

        %Model{model | m: m - m_error * learning_rate, b: b - b_error * learning_rate}
    end
  end
end
