class Location < ApplicationRecord
  belongs_to :user
  serialize :coordinates
end
