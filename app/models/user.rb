class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, format: { with: /\A[a-zA-Z]+\z/, message: "Please enter correct name" }
  validates :phone_no, :numericality => true, :length => { minimum: 10, maximum: 10 }

end
