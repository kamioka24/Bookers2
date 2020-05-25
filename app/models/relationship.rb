class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" #なぜ_idは要らないのか？
  belongs_to :followed, class_name: "User" #なぜ_idは要らないのか？

  #念のためバリデーション。なくても普通の動作は可能で大きな問題はない。
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
