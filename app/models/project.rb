class Project < ActiveRecord::Base
  has_many :investments
  has_many :investors, through: :investments, source: :user, uniq: true

  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :name, :latitude, :longitude, presence: true

  paginates_per 6

  include Addressable

  include PublicActivity::Model
  tracked skip_defaults: true

  def image_url
    image.url(:thumb)
  end
end

