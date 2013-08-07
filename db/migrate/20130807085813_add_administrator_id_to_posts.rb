class AddAdministratorIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :administrator_id, :integer
  end
end
