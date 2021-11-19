class RemanePagesToInfoPages < ActiveRecord::Migration[6.1]
  def change
    rename_table :pages, :info_pages
  end
end
