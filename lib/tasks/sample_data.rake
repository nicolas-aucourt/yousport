namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_events
  end
end

def make_users
  99.times do |n|
    email = "example-#{n+1}@yousport.com"
    password  = "password"
    User.create!(:email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_events
  User.all(:limit => 6).each do |user|
    20.times do
      name = Faker::Lorem.sentence(5)
      description = Faker::Lorem.sentence(54)
      user.events.create!(:name => name, :description => description)
    end
  end
end

