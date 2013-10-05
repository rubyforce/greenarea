# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
  	email				"watson@example.com"
  	name				"John Watson"
  	message	"Some text here"
  end
end
