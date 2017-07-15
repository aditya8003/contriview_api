class AddTotalsColumnToPopulation < ActiveRecord::Migration[5.0]
  def change
    add_column :populations, :total_pop, :integer
  end
end
