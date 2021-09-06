class CreateBookLists < ActiveRecord::Migration[6.1]
  def change
    create_table :book_lists do |t|
      t.references :book, null: false, index: true
      t.references :list, null: false, index: true
      t.timestamps
    end
  end
end
