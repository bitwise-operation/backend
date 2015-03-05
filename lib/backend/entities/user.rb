require 'lotus/model'

class User
  include Lotus::Entity
  attributes :name, :avatar
end
