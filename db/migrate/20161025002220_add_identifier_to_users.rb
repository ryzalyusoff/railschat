class AddIdentifierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identifier, :string

    add_index :users, ["identifier"]
  end
end
