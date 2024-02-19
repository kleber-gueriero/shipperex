use Mix.Config

config :shipperex,
  carrier_adapters: [Correx]

config :correx,
  administrative_code: "fake_administrative_code",
  sigep_password: "fake_sigep_password"
