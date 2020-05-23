class BookComment < ApplicationRecord
	belongs_to :user
	belongs_to :post_book

	validates :comment, presence: true #空欄
end