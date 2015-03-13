class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :user, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
