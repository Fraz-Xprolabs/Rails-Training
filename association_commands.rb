# HAS_ONE :THROUGH

supplier = Supplier.create!(name: "Fraz")
account = supplier.create_account!(number: "ABC")
account_history = account.create_account_history!(status: "true")
supplier.account_history.status

# HAS_AND_BELONGS_TO_MANY
s = Student.create(name: "Ali", age: 21)
c = Course.create(title: "Math", description: "Algebra and Geometry")
s.courses << c

# POLYMORPHIC ASSOCIATION
order = Order.create(order_number: "ORD123", amount: 1500.00)
profile = Profile.create(name: "Syed Fraz", email: "fraz@example.com")
order.activity_logs.create(action: "created")
order.activity_logs.create(action: "shipped")
profile.activity_logs.create(action: "Email Activated")
order.activity_logs.pluck(:action)
log = ActivityLog.first
log.trackable
log.trackable.amount=30
log.trackable.amount_changed?
log.trackable.previous_changes
log.trackable.changed
log.trackable.save

# STI (SIngle Table Inheritence)
rails generate model Vehicle name:string wheels:integer type:string
Car.create(name: "Honda Civic", wheels: 4)
Bike.create(name: "Yamaha YBR", wheels: 2)
Vehicle.first.type
Vehicle.first.fuel_type
Bike.first.fuel_type
