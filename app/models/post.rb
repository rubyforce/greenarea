class Post < ActiveRecord::Base
  validates_presence_of :title, :content

  # self.per_page = 6

  mount_uploader :post_image, PostImageUploader
end

