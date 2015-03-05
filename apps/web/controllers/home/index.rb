module Web::Controllers::Home
  class Index
    include Lotus::Action

    def call(params)
      self.format = :json
      self.body = JSON.generate({success: true})
    end
  end
end
