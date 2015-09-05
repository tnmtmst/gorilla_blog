class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title,       null: false
      t.text :body,        null: false
      t.datetime :posted_at, null: false

      t.timestamps null: false
    end

    add_index :articles, :title
  end
end
