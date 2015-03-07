require_relative './base_serializer'

class UserSerializer < BaseSerializer
  attributes :id, :name, :avatar_url, :win_count, :loss_count

  def avatar_url
    object.avatar
  end

  def win_count
    2
  end

  def loss_count
    0
  end
end
