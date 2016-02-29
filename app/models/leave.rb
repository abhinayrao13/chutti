class Leave < ActiveRecord::Base
  belongs_to :user
  validates :reason_for_leave, presence: true
end
