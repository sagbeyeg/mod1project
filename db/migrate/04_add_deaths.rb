class AddDeaths < ActiveRecord::Migration[6.0]
    def change 
        add_column :players, :deaths, :integer
    end
end