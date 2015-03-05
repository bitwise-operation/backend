# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/pride'

Lotus::Application.preload!

class MiniTest::Spec
  after :each do
    [
      MatchRepository,
      ScoreRepository,
      DeviceRepository,
      UserRepository,
    ].each(&:clear)
  end
end
