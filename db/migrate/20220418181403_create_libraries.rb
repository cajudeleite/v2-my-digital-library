class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries do |t|
      t.string :db_id
      t.string :title
      t.string :overview
      t.string :poster_path
      t.string :backdrop_path

      t.timestamps
    end
  end
end
