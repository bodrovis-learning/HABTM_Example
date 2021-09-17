class ModifyAuthors < ActiveRecord::Migration[6.0]
  def change
    add_index :authors, :alias, unique: true
        Author.create :alias => "tomson", :name => "Tomson"
        Author.create :alias => "bobson", :name => "Bobson"
        Author.create :alias => "jonson", :name => "Jonson"

  end
end