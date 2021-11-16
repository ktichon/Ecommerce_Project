class FixGenreName < ActiveRecord::Migration[6.1]
  def change
    rename_column :genres, :name, :genre_name

  end
end
