class Book < ApplicationRecord
    validates :name, presence: true
    belongs_to :author
    belongs_to :genre
    has_many :lists, through :book_lists
end
