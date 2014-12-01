class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.text :description, null: false

      t.timestamps
    end
  end
end
