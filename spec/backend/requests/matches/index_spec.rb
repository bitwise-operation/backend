require 'spec_helper'

describe Web::Controllers::Matches::Index do
  include Rack::Test::Methods

  def app
    @app ||= Web::Application.new
  end

  def json
    JSON.parse(last_response.body)
  end

  before do
    3.times do
      creator = ScoreRepository.create(Score.new(user_id: UserRepository.create(User.new).id))
      opponent = ScoreRepository.create(Score.new(user_id: UserRepository.create(User.new).id))
      MatchRepository.create(Match.new(creator_id: creator.id, opponent_id: opponent.id))
    end
  end

  it 'returns a list of matches' do
    get app.routes.path(:index_matches)

    assert_equal 3, json['matches'].length
  end
end
