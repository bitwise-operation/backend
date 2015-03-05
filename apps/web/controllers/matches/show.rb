module Web::Controllers::Matches
  class Show
    include Lotus::Action

    def call(params)
      match = MatchRepository.find(params[:id])

      self.format = :json
      self.body = JSON.generate({
        match: {
          scheduled_at: match.scheduled_at.iso8601
        }
      })
    end
  end
end
