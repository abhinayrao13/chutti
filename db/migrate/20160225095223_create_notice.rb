class CreateNotice < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :subject
      t.integer :content
      t.integer :user_id
    end
  end
end
