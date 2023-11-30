# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
[ "Alunos de Atividades Orientada de Ensino","Alunos de Doutorado","Alunos de TCC","Alunos de Mestrado", "Bolsistas","Estagiários","Pesquisador colaborador","Voluntários","Docente"].each do |kind|
  bond = AcademicBond.find_or_create_by({ bond_kind: kind })

  puts "Created #{kind}" if bond.new_record?
end
