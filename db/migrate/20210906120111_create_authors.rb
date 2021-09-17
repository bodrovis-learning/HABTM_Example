class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :alias
      t.string :name
      t.integer :authorship_id

      t.timestamps
    end
  end
end
