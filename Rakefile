require 'rake'
require 'rake/testtask'
env = ENV.to_hash.fetch('RACK_ENV')

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :db do
  task :reset do
    system "psql -c 'DROP DATABASE IF EXISTS backend_#{env}'"
    system "psql -c 'CREATE DATABASE backend_#{env}'"
    system "sequel -m db/migrations postgres://localhost/backend_"+env
  end
end
