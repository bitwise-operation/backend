require 'lotus/model'
require Lotus::Configuration.new.root.join('lib', 'backend', 'entities', 'user')

class Seed
  include Lotus::Entity
  include Lotus::Validations
  def self.disperse
      creator1 = ScoreRepository.create(
                Score.new(user_id: UserRepository.create(
                    User.new(name: 'Bree Stanwyck', avatar: 'http://www.bignerdranch.com/img/nerds/headshots/bree-stanwyck.jpg'
                      )).id, count: 10))
      opponent1 = ScoreRepository.create(
                 Score.new(user_id: UserRepository.create(
                    User.new(name: 'Angie Terrell', avatar: 'http://www.bignerdranch.com/img/nerds/headshots/angie-terrell.jpg'
                      )).id, count: 42))
      match1 = MatchRepository.create(
              Match.new(creator_id: creator1.id, opponent_id: opponent1.id, state: 'scheduled', scheduled_at: Time.now + 60*60*24))
      creator2 = ScoreRepository.create(
                Score.new(user_id: UserRepository.create(
                    User.new(name: 'Kristin Marsicano', avatar: 'http://www.bignerdranch.com/img/nerds/headshots/kristin-marsicano.jpg'
                      )).id, count: 25))
      opponent2 = ScoreRepository.create(
                 Score.new(user_id: UserRepository.create(
                    User.new(name: 'Kylie Stradley', avatar: 'http://www.bignerdranch.com/img/nerds/headshots/kylie-stradley.jpg'
                      )).id, count: 3))
      match2 = MatchRepository.create(
              Match.new(creator_id: creator2.id, opponent_id: opponent2.id, state: 'scheduled', scheduled_at: Time.now + 60*60*45))
      match3 = MatchRepository.create(
              Match.new(creator_id: creator2.id, opponent_id: opponent1.id, state: 'scheduled', scheduled_at: Time.now + 60*60*36))
      match4 = MatchRepository.create(
              Match.new(creator_id: creator1.id, opponent_id: opponent2.id, state: 'scheduled', scheduled_at: Time.now + 60*60*12))
  end
end
