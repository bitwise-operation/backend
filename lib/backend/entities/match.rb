require 'lotus/model'

class Match
  include Lotus::Entity
  attributes :winner_id,
             :left_score_id,
             :right_score_id,
             :scheduled_at,
             :status
end
