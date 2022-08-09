class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.string :author
      t.integer :published_year
      t.string :genre
      t.integer :stock

      t.timestamps
    end
  end
end
