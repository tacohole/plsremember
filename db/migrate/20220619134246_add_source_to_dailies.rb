class AddSourceToDailies < ActiveRecord::Migration[6.0]
  def change
    add_column :dailies, :source, :string, after: 'message'
  end
end
