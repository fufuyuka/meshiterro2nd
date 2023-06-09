class PostImage < ApplicationRecord
  
  #ActiveStorageでimageカラムとして画像を持たせる
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, :image, presence: true

  #いいね済か否かを特定する
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  #画像未保存の場合のデフォルト画像の差し込み
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
