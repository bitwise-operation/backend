require 'lotus/model'

class User
  include Lotus::Entity
  attributes :name, :avatar, :authentication_token

  def initialize(*)
    self.authentication_token ||= SecureRandom.uuid
    super
  end

  def win_count
    MatchRepository.all.count { |match| match.winner_id == self.id }
  end

  def match_count
    MatchRepository.all.count { |match| match.creator_id == self.id || match.opponent_id == self.id }
  end

  def loss_count
    match_count - win_count
  end
end
