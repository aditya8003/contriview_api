# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Population.destroy_all
County.destroy_all
AmericanState.destroy_all

File.open('db/states.txt').each do |line|
  line = line.split("|")
  AmericanState.create(
    state_code: line[0],
    state_abbrev: line[1],
    state_name: line[2]
  )
end

File.open('db/counties.txt').each do |line|
  line = line.split(",")
  County.create(
    american_state_id: AmericanState.where(state_code: line[1].to_i).first.id,
    fips_county_id: line[2].to_i,
    county_name: line[3]
  )
end

stats = HTTParty.get("http://api.census.gov/data/2015/acs5?get=B05001_002E,B05001_005E,B05001_006E&for=county:*&key=#{ENV["CENSUS_KEY"]}")
stats = stats.body.split("],")
stats = stats.drop(1)
stats.each do |line|
  line = line.split(',')
  Population.create(
    citizens_born_in_us: line[0].gsub(/\D/, '').to_i,
    naturalized_citizens:line[1].gsub(/\D/, '').to_i,
    non_citizens: line[2].gsub(/\D/, '').to_i,
    american_state: AmericanState.where(state_code: line[3].gsub(/\D/,'').to_i).first,
    county: County.where(fips_county_id: line[4].gsub(/\D/, '').to_i).first
  )
end
