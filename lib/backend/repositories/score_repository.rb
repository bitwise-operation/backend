require 'lotus/model'

class ScoreRepository
  include Lotus::Repository

  def self.for(match:, user:)
    creator = match.creator
    opponent = match.opponent

    case
    when creator.user_id == user.id
      creator
    when opponent.user_id == user.id
      opponent
    end
  end
end
