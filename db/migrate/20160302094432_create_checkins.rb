class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.date :date
      t.datetime :check_in
      t.datetime :check_out
    end
  end
end
