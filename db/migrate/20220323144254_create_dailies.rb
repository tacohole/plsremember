class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.id :id
      t.date :sent_date
      t.string :message
      t.date :updated_at
      t.date :created_at
      
      t.timestamps
    end
  end
end
