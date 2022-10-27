class Story < ApplicationRecord
  validates :title, :description, presence: true
  after_create_commit { broadcast_prepend_to 'stories' }
end
