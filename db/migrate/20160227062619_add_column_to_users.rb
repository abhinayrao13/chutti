class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :max_leaves, :integer
  end
end
