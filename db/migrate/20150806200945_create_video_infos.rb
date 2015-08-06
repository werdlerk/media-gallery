class CreateVideoInfos < ActiveRecord::Migration
  def change
    create_table :video_infos do |t|
      t.integer :width
      t.integer :height
      t.integer :duration
    end
  end
end
