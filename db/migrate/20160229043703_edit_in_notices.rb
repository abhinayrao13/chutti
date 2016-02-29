class EditInNotices < ActiveRecord::Migration
  def change
    change_column :notices, :content, :string
  end
end
