require 'spec_helper'
require 'time'

describe Web::Controllers::Matches::Confirm do
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
  let(:state) { 'confirmed' }

  before do
    post app.routes.path(:confirm_match, match.id)
  end

  it 'succeeds' do
    assert last_response.ok?
  end

  it 'updates match status' do
    assert_equal 'confirmed', json['match']['state']
  end
end
