class CreateAmericanStates < ActiveRecord::Migration[5.0]
  def change
    create_table :american_states do |t|
      t.integer :state_code
      t.string :state_abbrev
      t.string :state_name
      t.timestamps
    end
  end
end
