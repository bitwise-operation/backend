require 'lotus/model'
require Lotus::Configuration.new.root.join('lib', 'backend', 'entities', 'user')

class Match
  include Lotus::Entity
  include Lotus::Validations

  attribute :creator_id,  type: Integer, presence: true
  attribute :opponent_id, type: Integer, presence: true
  attribute :winner_id
  attribute :scheduled_at, type: DateTime
  attribute :state, type: String

  def creator
    ScoreRepository.find(creator_id)
  end

  def creator_name
    UserRepository.find(creator_id).name
  end

  def opponent
    ScoreRepository.find(opponent_id)
  end

  def opponent_name
    UserRepository.find(opponent_id).name
  end

  def confirm
    self.state = 'confirmed'
  end

  def schedule
    self.state = 'scheduled'
  end

  def start
    self.state = 'started'
  end

  def complete
    self.state = 'completed'
  end

  def draw
    self.state = 'drawn'
  end

  def winner_id
    if self.state == 'completed'
      if creator.count > opponent.count
        creator_id
      else
        opponent_id
      end
    end
  end
end
