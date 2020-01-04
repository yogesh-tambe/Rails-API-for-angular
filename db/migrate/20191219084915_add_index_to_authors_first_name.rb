class AddIndexToAuthorsFirstName < ActiveRecord::Migration[5.2]
  def change
  	add_index :authors, :first_name
  end
end
