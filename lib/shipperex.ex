defmodule Shipperex do
  @moduledoc """
  Documentation for `Shipperex`.
  """

  # @spec calculate_freight(Shipperex.CalculateFreight.Input.t, list) :: Shipperex.CalculateFreight.result
  def calculate_freight(params, opts \\ []) do
    Shipperex.CalculateFreight.call(params, opts)
  end
end
