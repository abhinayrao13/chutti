class Notice < ActiveRecord::Base
  belongs_to :user
  
  validates :subject, :presence => true
  validates :content, :presence => true
end
