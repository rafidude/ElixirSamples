defmodule StatsTest do
  use ExUnit.Case

  describe "Stats on list of numbers" do
    setup do
      [ list: [5, 2, 8],
        sum: 15,
        count: 3
      ]
    end
    test "count", input do
      assert Stats.count(input.list) == input.count
    end

    test "sum", input do
      assert Stats.sum(input.list) == input.sum
    end

    test "average", input do
      assert Stats.average(input.list) == input.sum / input.count
    end
  end
end
