class CreateLeave < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.string :reasonforleave
      t.integer :user_id
      t.string :status
    end
  end
end
