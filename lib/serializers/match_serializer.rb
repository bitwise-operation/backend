require_relative './base_serializer'

class MatchSerializer < BaseSerializer
  root :match
  attributes :scheduled_at, :status
end
