module Web::Controllers::Matches
  class Schedule
    include Lotus::Action
    params do
      param :id
    end

    def call(params)
      match = MatchRepository.find(params[:id])
      match.schedule
      MatchRepository.update(match)

      self.format = :json
      self.body = MatchSerializer.new(match).to_json
    end
  end
end
