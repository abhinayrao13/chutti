class Leave < ActiveRecord::Base
  belongs_to :users
  validates :reason_for_leave, presence: true
end
