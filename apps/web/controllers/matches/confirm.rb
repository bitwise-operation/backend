module Web::Controllers::Matches
  class Confirm
    include Lotus::Action
    params do
      param :id
    end

    def call(params)
      match = MatchRepository.find(params[:id])
      match.confirm
      MatchRepository.update(match)

      self.format = :json
      self.body = MatchSerializer.new(match).to_json
    end
  end
end
