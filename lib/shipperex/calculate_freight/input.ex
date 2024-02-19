defmodule Shipperex.CalculateFreight.Input do
  @moduledoc false
  @type service :: %{carrier: String.t(), name: String.t(), code: String.t()}
  @type t :: %__MODULE__{
          services: list(service()),
          sender_zip_code: String.t(),
          recipient_zip_code: String.t()
          # object_type: Shipperex.CalculateFreight.object_types,
        }
  @enforce_keys [
    :services,
    :sender_zip_code,
    :recipient_zip_code,
    :object_type,
    :weight,
    :length,
    :height,
    :width
  ]
  defstruct [
    :services,
    :sender_zip_code,
    :recipient_zip_code,
    :object_type,
    :weight,
    :length,
    :height,
    :width,
    diameter: 0,
    own_hands: false,
    declared_value: 0,
    receipt_notification: false
  ]
end
