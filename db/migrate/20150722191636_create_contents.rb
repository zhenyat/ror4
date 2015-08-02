class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :article, index: true
      t.text :doc, :limit => 4294967295

      t.timestamps
    end
  end
end
