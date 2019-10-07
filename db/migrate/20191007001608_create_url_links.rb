class CreateUrlLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :url_links do |t|

      t.string :original_url, null: false
      t.string :shortened_url, null: false, unique: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
