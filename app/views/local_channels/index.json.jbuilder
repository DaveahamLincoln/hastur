json.array!(@local_channels) do |local_channel|
  json.extract! local_channel, :id, :message
  json.url local_channel_url(local_channel, format: :json)
end
