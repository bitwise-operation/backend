module Web::Controllers::Users
  class Create
    include Lotus::Action

    params do
      param :name, type: String, presence: true
    end

    def call(params)
      u = User.new(name: params[:name], avatar: params[:avatar])
      user = UserRepository.create(u)

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
