defmodule Shipperex.CalculateFreight do
  # @spec call(%Shipperex.CalculateFreight.Input{}, list) :: result
  def call(params, opts \\ []) do
    case validate(params) do
      {:ok, _} -> 
        result = call_apis(params, opts)
        {:ok ,result}
      error -> error
    end
  end

  @object_types %{
    box: :box,
    envelope: :envelope,
    tube: :tube
  }
  def object_types, do: @object_types

  defp validate(params) do
    if params.recipient_zip_code == "" do
      {:error, %{
        message: "Some fields are invalid",
        errors: %{
          recipient_zip_code: "can't be empty"
        }
      }}
    else
      {:ok, nil}
    end
  end

  defp call_apis(params, opts) do
    carriers()
    |> Enum.map(fn carrier ->
      case carrier.calculate_freight(params, opts) do
        {:ok, result} -> result
        {:error, error} -> %{
          error: error
        }
      end
    end)
    |> List.flatten()
  end

  defp carriers() do
    Application.get_env(:shipperex, :carrier_adapters)
  end
end
