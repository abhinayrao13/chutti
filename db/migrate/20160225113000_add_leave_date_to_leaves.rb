class AddLeaveDateToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_date, :string
  end
end
