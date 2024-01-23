require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/ascii_outputter'
require 'barby/outputter/png_outputter'

class Student < ApplicationRecord
  has_one_attached :barcode
  after_create :generate_barcode

  private

  def generate_barcode
    barcode = Barby::Code128B.new("http://localhost:3000/students/#{self.id}")
    png = Barby::PngOutputter.new(barcode).to_png
    # image_name = SecureRandom.hex(10)
    image_name = SecureRandom.random_number(1_000_000_000).to_i.to_s
    IO.binwrite("tmp/#{image_name}.png", png.to_s)

    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open("tmp/#{image_name}.png"), 
      filename: image_name,
      content_type: 'png'
    )
    self.barcode.attach(blob)
  end
end
