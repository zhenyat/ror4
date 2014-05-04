class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string  :filename, null: false
      t.string  :title,    null: false

      t.timestamps
    end
  end
end
