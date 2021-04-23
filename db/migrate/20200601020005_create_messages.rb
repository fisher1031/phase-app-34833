class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :place, null:false
      t.string :reason, null:false
      t.string :how, null:false
      t.timestamps
    end
  end
end