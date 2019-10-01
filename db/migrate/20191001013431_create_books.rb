class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: true
      t.string :isbn
      t.integer :price
      t.text :short_description

      t.timestamps
    end
  end
end
