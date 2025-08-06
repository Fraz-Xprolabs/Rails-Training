class Profile < ApplicationRecord
  has_many :activity_logs, as: :trackable, dependent: :destroy
end
