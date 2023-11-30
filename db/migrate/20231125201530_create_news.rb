class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.integer :visibility

      t.timestamps
    end
  end
end
