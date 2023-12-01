class CreateNewsProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :news_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :news, null: false, foreign_key: true

      t.timestamps
    end
  end
end
