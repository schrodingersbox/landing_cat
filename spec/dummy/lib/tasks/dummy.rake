namespace :dummy do

  desc 'Rebuild the database with fresh migrations from engine'
  task :rebuild => :environment do
    Rake::Task[ 'db:drop' ].invoke
    Rake::Task[ 'db:create' ].invoke

    `rm -r db/migrate/*`
    Rake::Task[ 'landing_cat:install:migrations' ].invoke
    `rake split_cat:install:migrations`
    `git add db/migrate/*`

    [ 'development', 'test' ].each do |env|
      puts `rake db:migrate RAILS_ENV=#{env}`
    end
  end

end