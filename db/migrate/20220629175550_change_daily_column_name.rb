class ChangeDailyColumnName < ActiveRecord::Migration[6.0]
  def change
    add_column :dailies, :media, :string, after: 'source'
    remove_column :dailies, :type
  end
end
