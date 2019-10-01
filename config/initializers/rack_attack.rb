class Rack::Attack 
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('req/ip', limit: 10, period: 60) do |req|
    req.ip
  end

  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
      [{ error: "You reached the API usage limit. Please retry later." }.to_json]
    ]
  }

  # whitelist('allow-localhost') do |req|
  #   '127.0.0.1' == req.ip || '::1' == req.ip
  # end

end