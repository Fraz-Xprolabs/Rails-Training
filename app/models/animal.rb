class Animal < ApplicationRecord

    attr_accessor :new_tag, :new_tag_confirmation, :terms_of_tracking

    # Validating name and species to be present
    validates :name, :species, presence: true
    validates :tag_id, absence: true
    validates :new_tag, confirmation: true
    validates :terms_of_tracking, acceptance: true
    validates :species, exclusion: { in: %w(dragon unicorn), message: "is mythical and not allowed" }
    validates :tag_id, format: { with: /\A[A-Z]{3}-\d{4}\z/, message: "must be in format ABC-1234" }
    validates :habitat, inclusion: { in: %w(forest savannah desert tundra ocean) }
    validates :notes, length: { minimum: 10, maximum: 500 }, allow_blank: true
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :weight, numericality: { greater_than: 0 }
    validates :name, uniqueness: { scope: :species, message: "already exists for this species" }

    # Conditional Validations
     validates :notes, presence: true, if: :endangered?

    def endangered?
      endangered == true
    end

    # Custom Validation Method
     validate :age_reasonable_for_species

    def age_reasonable_for_species
      if species == "tortoise" && age.present? && age > 200
        errors.add(:age, "seems unrealistically high for a tortoise")
      end
    end
end
