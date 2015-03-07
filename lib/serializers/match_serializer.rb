require_relative './base_serializer'
require_relative './user_serializer'

class MatchSerializer < BaseSerializer
  root :match
  attributes :id, :scheduled_at, :state, :creator, :opponent, :winner_id, :match_time

  def creator
    UserSerializer.new(object.creator.user).to_hash
  end

  def opponent
    UserSerializer.new(object.opponent.user).to_hash
  end
end
