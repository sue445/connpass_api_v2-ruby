shared_context :api_variables do
  let(:client)  {  ConnpassApiV2::Client.new(api_key) }

  let(:api_key) { "thisissecret" }

  let(:request_headers) do
    {
      "Accept" => "*/*",
      "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
      "Content-Type" => "application/json",
      "User-Agent" => "connpass_api_v2-ruby/v#{ConnpassApiV2::VERSION} (+https://github.com/sue445/connpass_api_v2-ruby)",
      "X-API-KEY" => api_key,
    }
  end

  let(:response_headers) { { "Content-Type" =>  "application/json" } }
end
