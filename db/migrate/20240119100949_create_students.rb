class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :enroll_number
      t.boolean :fees_status
      t.boolean :eligiable_for_exam
      t.string :marks

      t.timestamps
    end
  end
end
