class Notice < ActiveRecord::Base
  belongs_to :users

  validates :subject, :presence => true
  validates :content, :presence => true
end
