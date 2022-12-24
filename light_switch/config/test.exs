import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :light_switch, LightSwitchWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "W5iydEGztx1EYNRm0SDc4x/8C6LKHcu/7jPJPS0O6aY6gd33OTr+xVaES3rAiKoG",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
