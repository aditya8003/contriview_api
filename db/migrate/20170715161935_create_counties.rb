class CreateCounties < ActiveRecord::Migration[5.0]
  def change
    create_table :counties do |t|
      t.integer :fips_county_id
      t.string :county_name
      t.references :american_state, foreign_key: true
    end
  end
end
