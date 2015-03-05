require 'lotus/model'

class MatchRepository
  include Lotus::Repository

  def self.count
    query.count
  end
end
