class CreateAcademicBonds < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_bonds do |t|
      t.string :bond_kind

      t.timestamps
    end
  end
end
