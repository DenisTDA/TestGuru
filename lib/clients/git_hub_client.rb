class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = ENV['ACCESS_TOKEN_TESTGURU']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def list_gists
    @http_client.gists
  end

  private

  def setup_http_client
    Octokit::Client.new(api_endpoint: ROOT_ENDPOINT, access_token: ACCESS_TOKEN)
  end
end
