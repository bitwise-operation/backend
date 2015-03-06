module Web::Controllers::Scores
  class Create
    include Lotus::Action

    def call(params)
      match = MatchRepository.find(params[:match_id])
      user  = UserRepository.find(params[:user_id])
      score = ScoreRepository.for(match: match, user: user)

      self.format = :json
      if score
        ScoreRepository.update(score.tap(&:increment))
        self.body = ScoreSerializer.new(match).to_json
      else
        self.status = 404
      end
    end
  end
end
