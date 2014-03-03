class RemoveEmailFromUsers < ActiveRecord::Migration
  def self.down
    remove_column :users, :email
  end
end
