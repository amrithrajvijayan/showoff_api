class CreateWidgets < ActiveRecord::Migration[7.1]
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
