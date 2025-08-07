class Student < ApplicationRecord
  has_and_belongs_to_many :courses
  scope :older_than, ->(age) { where("age > ?", age) }
  scope :with_name, ->(name) { where(name: name) }
end
