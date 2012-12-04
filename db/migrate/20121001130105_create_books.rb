class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publiser
      t.text :summary
      t.date :date_of_publish
      t.integer :price

      t.timestamps
    end
  end
end
