class Inquiry < ApplicationRecord
    belongs_to :customer
    
    enum support_status: { waiting: 0, working: 1,completed: 2 }
    
end
