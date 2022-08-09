class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :published_year
      t.string :genre
      t.integer :stock

      t.timestamps
    end
  end
end
