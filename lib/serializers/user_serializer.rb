require_relative './base_serializer'

class UserSerializer < BaseSerializer
  attributes :id, :name
end
