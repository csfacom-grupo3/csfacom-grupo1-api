class CreateProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_members do |t|
      t.date :entryDate
      t.date :departureDate
      t.boolean :active

      t.timestamps
    end
  end
end
