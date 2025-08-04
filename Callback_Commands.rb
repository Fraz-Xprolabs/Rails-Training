class Article < ApplicationRecord
  before_validation :capitalize_title
  after_validation :log_validation

  before_save :set_default_content
  after_save :log_saved

  around_save :wrap_save

  before_create :before_creating
  after_create :after_creating

  before_update :before_updating
  after_update :after_updating

  before_destroy :before_deleting
  after_destroy :after_deleting

  after_touch :log_touch
end
