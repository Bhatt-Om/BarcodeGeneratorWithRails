class RemoveColumnFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :barcode, :string
  end
end
