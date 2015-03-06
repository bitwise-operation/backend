module Web::Controllers::Matches
  class Confirmed
    include Lotus::Action

    def call(params)
      self.format = :json
      self.body = MatchSerializer.serialize_list(MatchRepository.confirmed)
    end
  end
end

