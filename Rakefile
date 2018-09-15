namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel/core'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect('sqlite://geniuses.db') do |db|
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
  end
end
namespace :test do
  desc 'Run spec'
  task :spec do
    sh 'rm geniuses.db'
    sh 'rake db:migrate'
    sh 'rspec spec/models_test/genius_test.rb'
    sh 'rspec spec/models_test/invention_test.rb'
    sh 'rspec spec/spec_test_app.rb'
    sh 'rspec spec/visit_test.rb'
  end
end
task :run do
  sh 'bundle install'
  sh 'rake db:migrate'
  sh 'ruby app_one.rb'
end
