class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url
      t.references :user, index: true
      t.references :media_info, polymorphic: true, index: true
      t.timestamps
    end
  end
end
