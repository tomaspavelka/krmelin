class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  scope :enabled_testing_emails, -> { where(enable_testing_emails: true) }
end
