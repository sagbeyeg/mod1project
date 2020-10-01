class CreatePlayer < ActiveRecord::Migration[6.0]
    def change
        create_table :players do |t|
            t.string :name
            t.string :LastChoice_ID
        end
    end
end

#add_column :SPECIAL, :array

