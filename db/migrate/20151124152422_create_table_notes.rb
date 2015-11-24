class CreateTableNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :author
      t.string :title
      t.text :content
      t.text :summary
      t.boolean :private, default: false
      t.integer :valuation

      t.timestamps null: false
    end
    add_index :notes, :author
  end
end
