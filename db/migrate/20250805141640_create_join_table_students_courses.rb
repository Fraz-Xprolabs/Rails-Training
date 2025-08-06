class CreateJoinTableStudentsCourses < ActiveRecord::Migration[8.0]
  def change
    create_table "courses_students", id: false, force: :cascade do |t|
      t.bigint "student_id", null: false
      t.bigint "course_id", null: false
    end
  end
end
