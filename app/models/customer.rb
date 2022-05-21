class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  belongs_to :group
  has_many :inquiries, dependent: :destroy
  
  
  validates :name, presence: true
  validates :email, presence: true
  
end
