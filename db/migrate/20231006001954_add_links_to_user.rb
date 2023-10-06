class AddLinksToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_reference :users, :academic_bond, null: false, foreign_key: true
  end
end
