require 'lotus/model'

class User
  include Lotus::Entity
  attributes :name, :avatar, :authentication_token

  def initialize(*)
    self.authentication_token ||= SecureRandom.uuid
    super
  end

  def win_count
    completed_matches.count{ |match| match.winner_id == self.id }
  end

  def completed_match_count
    completed_matches.count{ |match| match.creator_id == self.id || match.opponent_id == self.id }
  end

  def loss_count
    completed_match_count - win_count
  end

  def completed_matches
    MatchRepository.all.select{ |match| match.state == 'completed' }
  end
end
