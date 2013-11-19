class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :token_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :linkedin]

  attr_accessor :current_password

  validates :email, :status, presence: true

  has_many :investments
  has_many :invested_projects, through: :investments, source: :project, uniq: true

  def investors
    # do not include self
    investments.map(&:project_investors).flatten.uniq - [self]
  end

  def total_invested
    investments.map(&:money).sum
  end

  scope :recent, lambda { |count| order('users.created_at desc').limit(count) }

  def role?(r)
    self.role.to_s == r.to_s
  end

  include SocialAuthentication
  include Addressable
  include Nameable

  include PublicActivity::Model
  tracked skip_defaults: true
end

