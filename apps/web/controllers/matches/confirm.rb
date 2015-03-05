module Web::Controllers::Matches
  class Confirm
    include Lotus::Action

    params do
      param :id, presence: true
    end

    def call(params)
      match = MatchRepository.find(params[:id])
      match.status = 'confirmed'
      MatchRepository.update(match)

      self.format = :json
      self.body = MatchSerializer.new(match).to_json
    end
  end
end
