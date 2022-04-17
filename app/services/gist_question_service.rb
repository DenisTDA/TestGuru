class GistQuestionService
  URL_GIST = 'gist.github.com'.freeze

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  GistResult = Struct.new(:url) do
    def success?
      url.include?(URL_GIST)
    end
  end

  def call
    gist = @client.create_gist(gist_params)
    GistResult.new(gist.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('gistquestionservice.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('ACCESS_TOKEN_GITHUB_GISTS'))
  end
end
