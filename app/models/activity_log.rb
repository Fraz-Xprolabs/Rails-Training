class ActivityLog < ApplicationRecord
  belongs_to :trackable, polymorphic: true
end
