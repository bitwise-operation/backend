require 'lotus/model'

class Match
  include Lotus::Entity
  include Lotus::Validations

  attribute :creator_id,  type: Integer, presence: true
  attribute :opponent_id, type: Integer, presence: true
  attribute :winner_id,  type: Integer
  attribute :opponent_id, type: Integer, presence: true
  attribute :scheduled_at, type: DateTime
  attribute :status, type: DateTime
end
