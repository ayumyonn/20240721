class CreateCollectionPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :collection_posts do |t|
      t.references :collection, foreign_key: true # コレクションの参照
      t.references :bookmark, foreign_key: true   # ブックマークの参照

      t.timestamps
    end
  end
end
