import Config

config :plug_http,
  cowboy_port: 8082

import_config "#{config_env()}.exs"
