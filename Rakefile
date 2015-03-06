require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :db do
  task :reset do
    env = ENV.to_hash.fetch('RACK_ENV')
    database_url = ENV.to_hash.fetch('DATABASE_URL')
    system "psql -c 'DROP DATABASE IF EXISTS backend_#{env}'"
    system "psql -c 'CREATE DATABASE backend_#{env}'"
    system "sequel -m $DATABASE_URL"
  end
end
