# First we created a Model for Animal

rails generate model Animal name:string species:string age:integer weight:float gender:string endangered:boolean habitat:string tag_id:string

# Added notes column afterwards

rails generate migration AddNotesToAnimals notes:text

# Added following validations in the model/animal.rb file

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


# Testing these validations with the following commands
 1. animal.errors.full_messages
 2. animal.new_tag="TAG-001"
 3. animal.new_tag_confirmation="TAG-001"
 4. animal.valid?
 5. animal.errors[:name]
 6. animal = Animal.new(
  age: 3,
  weight: 50,
  habitat: "forest"
)

 7. animal = Animal.new(
  name: "Fluffy",
  species: "unicorn",
  age: 3,
  weight: 70,
  habitat: "forest"
)

 8. animal = Animal.new(
  name: "Shadow",
  species: "wolf",
  age: 2,
  weight: 80,
  habitat: "mountain"
)

animal.valid?
animal.errors.full_messages

 9. animal = Animal.new(
  name: "Juno",
  species: "elephant",
  age: 15,
  weight: 1000,
  habitat: "savannah",
  terms_of_tracking: "0"
)

 10. animal = Animal.new(
  name: "Zara",
  species: "zebra",
  age: 3,
  weight: 60,
  habitat: "savannah",
  new_tag: "DEF-5678",
  new_tag_confirmation: "XYZ-5678",
  terms_of_tracking: "1"
)

 11. animal = Animal.new(
  name: "Oldie",
  species: "tortoise",
  age: 250,
  weight: 100,
  habitat: "desert"
)

 12. animal = Animal.new(
  name: "TigerKing",
  species: "tiger",
  age: 8,
  weight: 220,
  habitat: "forest",
  endangered: true,
  notes: nil
)
