class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :lecture_id
      t.integer :professor_id

      t.timestamps
    end
  end
end
