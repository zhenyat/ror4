class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :authors
      t.string :title
      t.date :issue_date
      t.string :url

      t.timestamps
    end
  end
end
