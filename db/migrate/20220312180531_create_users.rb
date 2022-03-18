class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :subscribed
      t.boolean :verified
      t.datetime :signup_date
      t.datetime :unsubscribed_date

      t.timestamps
    end
  end
end
