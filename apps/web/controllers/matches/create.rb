module Web::Controllers::Matches
  class Create
    include Lotus::Action

    params do
      param :match, presence: true do
        param :scheduled_at, type: DateTime
        param :opponent_id, type: Integer
        param :creator_id, type: Integer
      end
    end

    def call(params)

      self.format = :json

      match = Match.new(params[:match])
      if match.valid?
        MatchRepository.create(match)
        self.body = MatchSerializer.new(match).to_json
      else
        self.status = 400
      end
    end
  end
end
