class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :followers, :integer
    add_column :users, :following, :integer
    add_column :users, :likes, :integer
    add_column :users, :tweet_count, :integer
  end
end
