require 'lotus/model'

class Score
  include Lotus::Entity
  attributes :user_id, :match_id, :count

  def user
    UserRepository.find(user_id)
  end

  def increment
    self.count ||= 0
    self.count += 1
  end
end
