class Blog < ApplicationRecord
    attribute :content, :text
    has_many :comments, dependent: :destroy

end
  
