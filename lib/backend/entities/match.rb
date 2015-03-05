require 'lotus/model'

class Match
  include Lotus::Entity
  attributes :winner_id,
             :creator_id,
             :opponent_id,
             :scheduled_at,
             :status
end
