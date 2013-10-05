FactoryGirl.define do
  factory :project do
    name
    description "Some description here"
  end

  sequence(:name) { |i| "#{i}project" }
end
