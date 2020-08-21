class CreateKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :kinds do |t|
      t.string :description

      t.timestamps
    end
  end
end
