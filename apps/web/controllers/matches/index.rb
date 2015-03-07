module Web::Controllers::Matches
  class Index
    include Lotus::Action

    def call(params)
      self.format = :json
      self.body = MatchSerializer.serialize_list(MatchRepository.by_scheduled_at)
    end
  end
end
