class EditInNoticesToaddpostedon < ActiveRecord::Migration
  def change
    add_column :notices, :posted_on, :date
  end
end
