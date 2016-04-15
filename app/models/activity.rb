class Activity < ActiveRecord::Base
  scope :recent, -> { order("id DESC").limit(1) }
end
