class MasterLivingware < ApplicationRecord
  belongs_to :admin
  belongs_to :master_category
  validates :name, presence: true
end
