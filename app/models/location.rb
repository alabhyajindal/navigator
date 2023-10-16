class Location < ApplicationRecord
  validates :coordinates, uniqueness: {scope: :user_id}

  belongs_to :user
  serialize :coordinates
end
