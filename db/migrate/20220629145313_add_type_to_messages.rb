class AddTypeToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :dailies, :type, :string, after: 'source'
    add_column :dailies, :link, :string, after: 'type'
    add_index :users, :code
  end
end
