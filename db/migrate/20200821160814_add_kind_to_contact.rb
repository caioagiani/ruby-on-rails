class AddKindToContact < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :kind, foreign_key: true
  end
end
