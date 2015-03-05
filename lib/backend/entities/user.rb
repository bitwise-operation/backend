require 'lotus/model'

class User
  include Lotus::Entity
  attributes :name, :avatar, :authentication_token

  def initialize(*)
    self.authentication_token ||= SecureRandom.uuid
    super
  end
end
