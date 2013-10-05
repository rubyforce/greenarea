class Project < ActiveRecord::Base
  has_many :investments
  has_many :investors, through: :investments, source: :user, uniq: true

  mount_uploader :image, ImageUploader
  mount_uploader :company_image, CompanyImageUploader

  validates :name, :price, :owner, :start_investment, :finish_investment, presence: true

  paginates_per 6

  include Addressable

  include PublicActivity::Model
  tracked skip_defaults: true

  def per_share
    price / shares.to_f
  end
end

