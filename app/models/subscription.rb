class Subscription < ActiveRecord::Base
  validates :email, :uniqueness => true, :presence => true
end

