class Event < ApplicationRecord
    validates :title, presence: true
    
    belongs_to :person
end
