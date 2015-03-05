require 'json'

module Web::Controllers::Users
  class Create
    include Lotus::Action

    def call(params)
      self.format = :json
      self.body = JSON.generate({})
    end
  end
end
