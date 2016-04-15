class AddUsersAndActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.boolean :news_items_check, default: false
      t.timestamps null: false
    end

    create_table :users do |t|
      t.string :email
      t.timestamps null: false
    end

    add_column :news_items, :notified, :boolean, default: false
  end
end
