class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :coordinator, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
