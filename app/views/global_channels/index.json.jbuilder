json.array!(@global_channels) do |global_channel|
  json.extract! global_channel, :id, :message
  json.url global_channel_url(global_channel, format: :json)
end
