class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_many :notices
  has_many :leaves, class_name: "Leave"

  validates :name, :presence => true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :phone_no, :numericality => true, :length => { minimum: 10, maximum: 10 }
  validates :gender, :presence => true, inclusion: { in: ["male","female"] }
  validates :role_id, inclusion: { in: Role.get_role_ids }
  validates :max_leaves, :numericality => true, presence: true

end
