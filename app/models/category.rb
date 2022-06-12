class Category < ApplicationRecord
    belongs_to :group
    has_many :livingwares, dependent: :destroy
    validates :name, presence: true
end
