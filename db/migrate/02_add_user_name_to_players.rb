class AddUserNameToPlayers < ActiveRecord::Migration[6.0]
    def change 
        add_column :players, :username, :string
    end
end