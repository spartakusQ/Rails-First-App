class GitHubClient
  ROOT_ENDPOIN = 'https://api.github.com/'
  ACCESS_TOKEN = ENV['GITHUB_API_ACCESS_KEY']

  def initialize
    @http_client = setup_http_client
  end

  def crate_gist(params)
    @http_client.post('gist') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'app;ication/json'
      request.body = params.to_json
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOIN)
  end
end
