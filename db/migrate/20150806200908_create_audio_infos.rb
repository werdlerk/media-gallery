class CreateAudioInfos < ActiveRecord::Migration
  def change
    create_table :audio_infos do |t|
      t.integer :duration
      t.integer :size
    end
  end
end
