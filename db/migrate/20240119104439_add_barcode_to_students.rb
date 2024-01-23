class AddBarcodeToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :barcode, :string
  end
end
