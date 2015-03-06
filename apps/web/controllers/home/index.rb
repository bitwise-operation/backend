module Web::Controllers::Home
  class Index
    include Lotus::Action

    def call(params)
      self.format = :html
    end
  end
end
