require_relative './base_serializer'

class ScoreSerializer < BaseSerializer
  attributes :score_for_creator, :score_for_opponent

  def score_for_creator
    object.creator.count
  end

  def score_for_opponent
    object.opponent.count
  end
end
