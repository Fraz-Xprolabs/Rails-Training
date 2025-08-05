# HAS_ONE :THROUGH

supplier = Supplier.create!(name: "Fraz")
account = supplier.create_account!(number: "ABC")
account_history = account.create_account_history!(status: "true")
supplier.account_history.status

# HAS_MANY_AND_BELONGS_TO
s = Student.create(name: "Ali", age: 21)
c = Course.create(title: "Math", description: "Algebra and Geometry")
s.courses << c

