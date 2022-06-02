class MasterCategory < ApplicationRecord
    belongs_to :admin
    has_many :master_livingwares, dependent: :destroy
    validates :name, presence: true
end
