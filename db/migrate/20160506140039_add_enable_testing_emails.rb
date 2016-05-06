class AddEnableTestingEmails < ActiveRecord::Migration
  def change
    add_column :users, :enable_testing_emails, :boolean, default: false
  end
end
