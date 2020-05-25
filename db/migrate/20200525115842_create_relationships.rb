class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # indexを追加することで様々な手段での不正データ操作から、エラーを発生させることで防ぐことが可能に。
    add_index :relationships, [:follower_id, :followed_id], unique: true
    # ペアで重複するものが保存されないようにする設定。何度も同じユーザーをフォローできないようにする。
  end
end
