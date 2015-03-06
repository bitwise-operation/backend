require 'spec_helper'

describe Web::Controllers::Scores::Show do
  include Rack::Test::Methods

  def app
    @app ||= Web::Application.new
  end

  def json
    JSON.parse(last_response.body)
  end

  let(:creator) { ScoreRepository.create(Score.new(user_id: UserRepository.create(User.new).id, count: 10)) }
  let(:opponent) { ScoreRepository.create(Score.new(user_id: UserRepository.create(User.new).id, count: 42)) }
  let(:match) { MatchRepository.create(Match.new(creator_id: creator.id, opponent_id: opponent.id)) }

  it 'provides a score for the requested match' do
    get app.routes.path(:show_score, match.id)

    assert_equal 10, json['score_for_creator']
    assert_equal 42, json['score_for_opponent']
  end
end
