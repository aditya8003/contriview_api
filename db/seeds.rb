# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AmericanState.destroy_all

File.open('db/states.txt').each do |line|
  line = line.split("|")
  AmericanState.create(
    state_code: line[0],
    state_abbrev: line[1],
    state_name: line[2]
  )
end
