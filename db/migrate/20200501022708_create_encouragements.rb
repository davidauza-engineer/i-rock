class CreateEncouragements < ActiveRecord::Migration[6.0]
  def change
    create_table :encouragements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
