class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text

    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token, unique: true
  end
end
