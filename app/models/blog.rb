class Blog < ApplicationRecord
      validates :title, presence: true
      
      extend FriendlyId
      friendly_id :title, use: :slugged

end
