class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :icon # アイコン用のカラム
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
