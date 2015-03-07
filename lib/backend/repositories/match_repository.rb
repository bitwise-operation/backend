require 'lotus/model'

class MatchRepository
  include Lotus::Repository

  def self.count
    query.count
  end

  def self.confirmed
    query { where(state: 'confirmed') }
  end

  def self.by_scheduled_at
    query { order(:scheduled_at) }
  end
end
