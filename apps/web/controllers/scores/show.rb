module Web::Controllers::Scores
  class Show
    include Lotus::Action

    def call(params)
      match = MatchRepository.find(params[:match_id])
      user  = UserRepository.find(params[:user_id])
      score = match.score_for(user)

      self.format = :json
      self.body = ScoreSerializer.new(score).to_json
    end
  end
end
