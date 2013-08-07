class AddUsernameToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :username, :string
  end
end
