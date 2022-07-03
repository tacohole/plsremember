# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_file_path = 'db/data/seeds.csv'
puts "seeding from #{csv_file_path}"

csv = CSV.read(csv_file_path, headers: true)

csv.each do |row|
  message_data = {
    message: row[0],
    source: row[1],
    media: row[2],
    link: row[3],
    sent_date: row[4]
  }
  Daily.create(message_data)
end
