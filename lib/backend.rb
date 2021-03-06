require 'lotus/model'
Dir["#{ __dir__ }/backend/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/backend_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/backend_development.db'
  #    adapter type: :sql, uri: 'postgres://localhost/backend_development'
  #    adapter type: :sql, uri: 'mysql://localhost/backend_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL'] || "postgres://localhost/backend_#{ENV['RACK_ENV']}"
  UserRepository.adapter = adapter

  ##
  # Database mapping
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :users do
      entity User
      repository UserRepository

      attribute :id, Integer
      attribute :name, String
      attribute :avatar, String
      attribute :authentication_token, String
    end

    collection :scores do
      entity Score
      repository ScoreRepository

      attribute :id, Integer
      attribute :user_id, Integer
      attribute :match_id, Integer
      attribute :count, Integer
    end

    collection :matches do
      entity Match
      repository MatchRepository

      attribute :id, Integer
      attribute :winner_id, Integer
      attribute :creator_id, Integer
      attribute :opponent_id, Integer
      attribute :scheduled_at, DateTime
      attribute :state, String
    end

    collection :devices do
      entity Device
      repository DeviceRepository

      attribute :id, Integer
      attribute :user_id, Integer
      attribute :token, String
    end
  end
end.load!
