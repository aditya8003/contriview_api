class CreatePopulations < ActiveRecord::Migration[5.0]
  def change
    create_table :populations do |t|
      t.integer :citizens_born_in_us
      t.integer :naturalized_citizens
      t.integer :non_citizens
      t.references :american_state, foreign_key: true
      t.references :county, foreign_key: true
    end
  end
end
