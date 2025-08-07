# Basic retreival
Student.all
Student.first
Student.last
Student.find(1)
Student.find([2, 3, 4])
Student.take 
Student.find_by(name: "Ali")
Student.find_by_id(2)

# Checking Existence
Student.exists?(1)
Student.exists?(name: "Ali")

# Filtering Conditions
Student.where(name: "Ali", age: 18)
Student.where("age > ?", 15)
Student.where("name LIKE ?", "%ali%")
Student.where(age: 15..20)
Student.where(name: "Ali").where(age: 18)
Student.where(name: "Ali").or(Student.where(age: 21))

# Ordering
Student.order(:age)
Student.order(age: :desc)
Student.order(:name, :age)

# Selection
Student.select(:id, :name)
Student.pluck(:name)
Student.pluck(:name, :age)
Student.ids

# Limits and Offsets
Student.limit(5)
Student.offset(3)
Student.limit(2).offset(2)

# Grouping
Student.group(:age).count 
Student.group(:name).having("sum(age) > ? ", 200).sum(:age)

# JOINS
Student.joins(:courses)

# Eager Loading
Student.includes(:courses)

# Calculations
Student.count
Student.sum(:age)
Student.average(:age)
Student.minimum(:age)
Student.maximum(:age)


# Scoping commands
Student.older_than(20)
Student.name_like("ali")

# Overriding Conditions
Student.where(age: 20).where(name: "Ali").unscope(:where)
Student.where(age: 20).order(:name).only(:where)
Student.select(:name, :age).reselect(:id)
Student.order(:name).reorder(age: :desc)
Student.order(age: :asc).reverse_order
Student.where(age: 20).rewhere(age: 25)
Student.group(:age).regroup(:name).count
