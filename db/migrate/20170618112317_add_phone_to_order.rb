class AddPhoneToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :phone, :string
  end
end
