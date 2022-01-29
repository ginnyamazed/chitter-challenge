class CreateQuacks < ActiveRecord::Migration[7.0]
  def change
    create_table :quacks do |t|
      t.string :content
      t.string :tagged_users
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
