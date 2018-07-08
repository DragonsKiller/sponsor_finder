class AddColumnToPictures < ActiveRecord::Migration[5.1]
  def change
    add_attachment :pictures, :file
  end
end
