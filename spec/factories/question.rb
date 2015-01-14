require 'factory_girl_rails'
require 'faker'
# require 'factories'

FactoryGirl.define do

  factory :question do
    title {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
  end

end