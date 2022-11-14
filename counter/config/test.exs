import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :counter, CounterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "yGV02xp/UqiH27S3n3xsV/yzrR99e+tQt0UOUZbkHUWSdpTiZJa3AF12kK6hZF75",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
