module Web::Controllers::Users
  class Show
    include Lotus::Action

    # params do
    #   param :name, presence: true
    #   param :avatar
    # end

    def call(params)
      user = UserRepository.find(params[:id])

      self.format = :json
      self.body = JSON.generate({
        user: {
          id: user.id,
          name: user.name,
          avatar: user.avatar
        }
      })
    end
  end
end
