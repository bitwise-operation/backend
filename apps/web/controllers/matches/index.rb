module Web::Controllers::Matches
  class Index
    include Lotus::Action

    def call(params)
      self.format = :json
      self.body = MatchSerializer.serialize_list(MatchRepository.all)
    end
  end
end
