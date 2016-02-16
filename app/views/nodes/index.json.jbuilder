json.array!(@nodes) do |node|
  json.extract! node, :id, :l_weight, :g_weight, :u_weight, :queue
  json.url node_url(node, format: :json)
end
