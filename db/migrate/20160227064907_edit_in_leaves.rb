class EditInLeaves < ActiveRecord::Migration
  def change
    rename_column :leaves, :reasonforleave, :reason_for_leave
    rename_column :leaves, :leave_date, :leave_date_from
    add_column :leaves, :leave_date_to, :string
  end
end
