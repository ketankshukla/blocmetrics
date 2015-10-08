class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :url
      t.references :user, index: true, foreign_key: true
    end
  end
end
