class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :phone_no, :integer
    add_column :users, :doj, :date
    add_column :users, :role_id, :integer
  end
end
