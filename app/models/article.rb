class Article < ApplicationRecord
  before_validation :capitalize_title if: :title_needs_capitalization?
  after_validation :log_validation unless -> title.blank?

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

  private

  def capitalize_title
    self.title = title.capitalize if title.present?
  end

  def log_validation
    Rails.logger.info "Validation complete for article: #{title}"
  end

  def set_default_content
    self.content = "Default content" if content.blank?
  end

  def log_saved
    Rails.logger.info "Article #{id} saved."
  end

  def wrap_save
    Rails.logger.info "Around save - before"
    yield
    Rails.logger.info "Around save - after"
  end

  def before_creating
    Rails.logger.info "Before creating article"
  end

  def after_creating
    Rails.logger.info "After creating article"
  end

  def before_updating
    Rails.logger.info "Before updating article"
  end

  def after_updating
    Rails.logger.info "After updating article"
  end

  def before_deleting
    Rails.logger.info "Before deleting article"
  end

  def after_deleting
    Rails.logger.info "After deleting article"
  end

  def log_touch
    Rails.logger.info "Article #{id} was touched."
  end

  # Conditional Logic
  def title_needs_capitalization?
    title.present? && title == title.downcase
  end        
end
