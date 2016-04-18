class RemoveReadFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :read, :boolean
  end
end
