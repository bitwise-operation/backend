require 'spec_helper'
require 'time'

describe Web::Controllers::Matches::Create do
  include Rack::Test::Methods

  def app
    @app ||= Web::Application.new
  end

  let(:future_date) { Time.now + 24*60*60 }
  let(:creator) { UserRepository.create(User.new) }
  let(:opponent) { UserRepository.create(User.new) }
  let(:match) { MatchRepository.last }

  before do
    post app.routes.path(:create_match), match: {
      scheduled_at: future_date.iso8601,
      opponent_id: opponent.id,
      creator_id: creator.id
    }
  end

  it 'succeeds' do
    assert last_response.ok?
    assert_equal 1, MatchRepository.all.count
  end

  it 'sets match attributes properly' do
    assert_equal creator, match.creator
    assert_equal opponent, match.opponent
  end
end
