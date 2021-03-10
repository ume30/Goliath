class AddImageNameToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :image_name, :string
  end
end
