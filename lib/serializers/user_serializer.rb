require_relative './base_serializer'

class UserSerializer < BaseSerializer
  attributes :id, :name, :avatar_url

  def avatar_url
    object.avatar
  end
end
