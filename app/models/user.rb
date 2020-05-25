class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  def follow(other_user)
    follower.create(followed_id: other_user.id)
  end

  # ユーザーのフォローを外す
  def unfollow(other_user)
    follower.find_by(followed_id: uther_user.id).destroy
  end

  # フォローしていればtrueを返す
  def following?(other_user)
    following_user.include?(other_user)
  end
end