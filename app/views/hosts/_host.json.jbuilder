json.extract! host, :id, :hostname, :ip, :operating_system, :created_at, :updated_at
json.url host_url(host, format: :json)
