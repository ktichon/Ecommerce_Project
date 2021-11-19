class AddPermalinkToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :permalink, :string
  end
end
