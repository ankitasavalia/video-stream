class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.text :description
      t.string :categories
      t.references :user, null: false

      t.timestamps
    end
  end
end
