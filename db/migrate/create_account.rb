class CreateAccount < ActiveRecord::Migration
  def change
    create_table :account do |t|
      t.string :name
    end
  end
end
