class Event < ApplicationRecord
    validates :title, :year, :month, :day, presence: true
    
    belongs_to :person
end
