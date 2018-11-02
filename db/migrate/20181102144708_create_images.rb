class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string   "filename"
      t.string   "memo"
      t.binary   "image", limit: 10.megabyte
      t.string   "string"
    end
  end
end
