module Web::Controllers::Users
  class Show
    include Lotus::Action

    def call(params)
      user = UserRepository.find(params[:id])

      self.format = :json
      self.body = JSON.generate({
        user: {
          id: user.id,
          name: user.name,
          avatar: user.avatar,
          win_count: user.win_count,
          loss_count: user.loss_count
        }
      })
    end
  end
end
