class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.text :problem
      t.string :industry
      t.string :team
      t.string :geographical_focus
      t.string :requirements
      t.text :next_steps
      t.date :publication_end_date

      t.timestamps
    end
  end
end
