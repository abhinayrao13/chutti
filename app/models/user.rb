class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  dragonfly_accessor :image

  belongs_to :role
  has_many :notices
  has_many :leaves, class_name: "Leave"
  has_many :checkins

  validates :name, :presence => true, format: { with: /\A[a-zA-Z]+\z/, message: "Only alphabets are allowed" }
  validates :phone_no, :numericality => true, :length => { minimum: 10, maximum: 10 }
  validates :gender, :presence => true, inclusion: { in: ["male","female"] }
  # if ActiveRecord::Base.connection.table_exists? 'roles'
  #   validates :role_id, inclusion: { in: Role.get_role_ids }
  # end
  validate :check_role
  validates :max_leaves, :numericality => true, presence: true
  def check_role
    unless Role.get_role_ids.include?(self.role_id)
      errors.add(:role_id, "Role not found")
    end
  end

end
