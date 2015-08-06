class CreateImageInfos < ActiveRecord::Migration
  def change
    create_table :image_infos do |t|
      t.integer :width
      t.integer :height
      t.string :mime_type
    end
  end
end
