defmodule Formv.EmployeesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Formv.Employees` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> Formv.Employees.create_employee()

    employee
  end
end
