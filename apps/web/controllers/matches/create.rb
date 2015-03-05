module Web::Controllers::Matches
  class Create
    include Lotus::Action
    include Authentication

    params do
      param :authentication_token, presence: true
      param :scheduled_at, type: DateTime
      param :opponent_id, type: Integer, presence: true
    end

    def call(params)
      match = Match.new(params)

      self.format = :json
      self.body = MatchSerializer.new(match).to_json
    end
  end
end
