require 'spec_helper'
require 'time'

describe Web::Controllers::Matches::Complete do
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
  let(:state) { 'completed' }

  before do
    patch app.routes.path(:complete_match, match.id)
  end

  it 'succeeds' do
    assert last_response.ok?
  end

  it 'updates match status' do
    assert_equal 'completed', json['match']['state']
  end
end
