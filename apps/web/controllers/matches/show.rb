module Web::Controllers::Matches
  class Show
    include Lotus::Action
    def call(params)
      match = MatchRepository.find(params[:id])

      self.format = :json
      self.body = MatchSerializer.new(match).to_json
    end
  end
end
