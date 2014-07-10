class CreateShortLinks < ActiveRecord::Migration
  def change
    create_table :short_links do |t|
      t.string :original_link
      t.string :short_code
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
