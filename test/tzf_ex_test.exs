defmodule TzfExTest do
  use ExUnit.Case
  doctest TzfEx

  test "finds a timezone for coordinates" do
    assert TzfEx.get_timezone_for_location(41.0082, 28.9784) == "Europe/Istanbul"
  end
end
