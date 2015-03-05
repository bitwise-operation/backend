require 'lotus/model'

class Device
  include Lotus::Entity
  attributes :user_id, :token
end
