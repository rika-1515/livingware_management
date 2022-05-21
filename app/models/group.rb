class Group < ApplicationRecord
    has_many :customers, dependent: :destroy
end
