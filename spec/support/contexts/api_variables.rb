shared_context :api_variables do
  let(:client)   {  TreasuryPrime::Client.new(api_base: api_base, username: username, token: token) }
  let(:api_base) { ENV["API_BASE"] }
  let(:username) { ENV["USERNAME"] }
  let(:token)    { ENV["TOKEN"] }

  let(:default_headers) do
    {
      "Accept" => "*/*",
      "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
      "Content-Type" => "application/json",
      "User-Agent" => "TreasuryPrime v#{TreasuryPrime::VERSION}",
    }
  end
end
