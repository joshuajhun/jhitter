class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :string
    add_column :users, :profile_picture, :string
    add_column :users, :location, :string
    add_column :users, :background_picture, :string
  end
end
