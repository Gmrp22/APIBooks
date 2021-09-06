class List < ApplicationRecord
    validates :name, presence: true
    has_many :books, through :book_lists
end
