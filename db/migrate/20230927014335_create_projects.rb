class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :members
      t.date :startDate
      t.date :endDate
      t.string :status

      t.timestamps
    end
  end
end
