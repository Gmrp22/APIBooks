class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.date :pubdate, null: true
      t.references :author, null: false, index: true
      t.references :genre, null: false, index: true
      t.timestamps
    end
  end
end
