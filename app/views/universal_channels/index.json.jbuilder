json.array!(@universal_channels) do |universal_channel|
  json.extract! universal_channel, :id, :message
  json.url universal_channel_url(universal_channel, format: :json)
end
