class CreateStory < ActiveRecord::Migration[6.0]
    def change
        create_table :stories do |t|
            t.boolean :isGameOver
            t.integer :player_id
            t.string :lastChoice
        end
    end
end

#add_column :SPECIAL, :array

