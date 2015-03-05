require 'json'

Dir[Lotus::Configuration.new.root.join('lib', 'serializers', '**', '*.rb')].each do |lib|
  require lib
end
