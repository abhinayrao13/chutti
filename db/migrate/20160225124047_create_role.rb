class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :user_role
    end
  end
end
