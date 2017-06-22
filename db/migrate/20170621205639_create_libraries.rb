class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name, null: false
      t.string :version
      t.belongs_to :language, index: true
      t.belongs_to :framework, index: true
      t.text :description
      t.string :documentation_url
      t.string :library_url
      t.integer :created_by_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :libraries, :languages
    add_foreign_key :libraries, :frameworks
  end
end
