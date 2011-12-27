class CreateUnitedStates < ActiveRecord::Migration
  def change
    create_table :united_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
