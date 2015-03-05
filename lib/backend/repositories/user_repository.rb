require 'lotus/model'

class UserRepository
  include Lotus::Repository

  def self.authenticate(token)
    query { where(authentication_token: token) }.first
  end
end
