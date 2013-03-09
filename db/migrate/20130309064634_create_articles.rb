class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content
      t.references :user
      t.string :article_type

      t.timestamps
    end
    add_index :articles, :user_id
  end
end
