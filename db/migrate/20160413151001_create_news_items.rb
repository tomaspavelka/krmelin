class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :imported_date
      t.string :imported_title
      t.string :imported_link

      t.timestamps null: false
    end
  end
end
