class Group < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :livingwares, dependent: :destroy

  has_secure_token
  validates :name, presence: true, on: :update
end
