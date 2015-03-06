require 'lotus/model'

class MatchRepository
  include Lotus::Repository

  def self.count
    query.count
  end

  def self.confirmed
    query { where(state: 'confirmed') }
  end
end
