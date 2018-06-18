class CreateRespondeds < ActiveRecord::Migration[5.1]
  def change
    create_table :respondeds do |t|
      t.belongs_to :idea, foreign_key: true
      t.belongs_to :investor, foreign_key: true

      t.timestamps
    end
  end
end
