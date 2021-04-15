class MigrationName < ActiveRecord::Migration[6.1]
  def change
    add_reference  :articles, :users, index: true, foreign_key: true
    add_reference  :comments, :users, index: true, foreign_key: true
  end
end
