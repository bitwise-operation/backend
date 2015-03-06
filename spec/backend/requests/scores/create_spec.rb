require 'spec_helper'

describe Web::Controllers::Scores::Show do
  include Rack::Test::Methods

  def app
    @app ||= Web::Application.new
  end

  def json
    JSON.parse(last_response.body)
  end

  let(:creator) { ScoreRepository.create(Score.new(user_id: UserRepository.create(User.new).id)) }
  let(:opponent) { ScoreRepository.create(Score.new(user_id: UserRepository.create(User.new).id)) }
  let(:match) { MatchRepository.create(Match.new(creator_id: creator.id, opponent_id: opponent.id)) }

  it 'succeeds' do
    post app.routes.path(:increment_score, match.id, creator.user_id)

    assert last_response.ok?
  end

  it 'increments the score for the requested user' do
    post app.routes.path(:increment_score, match.id, creator.user_id)

    assert_equal 1, json['score_for_creator']
    assert_equal nil, json['score_for_opponent']

    post app.routes.path(:increment_score, match.id, opponent.user_id)

    assert_equal 1, json['score_for_creator']
    assert_equal 1, json['score_for_opponent']
  end
end
