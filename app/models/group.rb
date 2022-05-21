class Group < ApplicationRecord
    has_many :customers, dependent: :destroy
    has_many :categories, dependent: :destroy
end
