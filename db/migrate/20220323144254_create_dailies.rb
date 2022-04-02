class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.string :message
      t.date :sent_date
      
      t.timestamps
    end
  end
end
