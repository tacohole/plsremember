class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.date :sent_date
      t.string :message
      
      t.timestamps
    end
  end
end
