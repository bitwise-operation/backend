module Web::Controllers::Scores
  class Show
    include Lotus::Action

    def call(params)
      match = MatchRepository.find(params[:match_id])

      self.format = :json
      self.body = ScoreSerializer.new(match).to_json
    end
  end
end
