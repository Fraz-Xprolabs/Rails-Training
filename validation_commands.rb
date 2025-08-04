# First we created a Model for Animal

rails generate model Animal name:string species:string age:integer weight:float gender:string endangered:boolean habitat:string tag_id:string

# Added notes column afterwards

rails generate migration AddNotesToAnimals notes:text

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
