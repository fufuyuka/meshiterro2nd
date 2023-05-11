class PostImage < ApplicationRecord
  #ActiveStorageでimageカラムとして画像を持たせる
  has_one_attached :image
  belongs_to :user
end
