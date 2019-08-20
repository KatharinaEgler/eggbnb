class AddPhotoToChickens < ActiveRecord::Migration[5.2]
  def change
    add_column :chickens, :photo, :string
  end
end
