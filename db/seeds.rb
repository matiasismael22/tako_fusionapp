# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Profile.destroy_all


# 2) Reindexar base de datos
#ActiveRecord::Base.connection.reset_pk_sequence!('module_types')
ActiveRecord::Base.connection.reset_pk_sequence!('profiles')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
# 3) Agregar datos
# Tipos de módulo
#ModuleType.create([
 #                     { :name => 'Tipo 1' },
  #                    { :name => 'Tipo 2'}
   #               ])
# Perfiles
Profile.create([
                   {:id => 1, :name => 'Administrador', :description => 'Administrador' },
                   {:id => 2, :name => 'Usuario', :description => 'Usuario' }# 1 La última línea no lleva coma
               ])

# Usuarios
User.create([
                { :email => 'admin@takofusion.cl', :password => 123456789, :name => 'Administrador', :profile_id => 1  },
                { :email => 'userprueba@takofusion.cl', :password => 123456789, :name => 'Usuario Prueba', :profile_id => 2}# 1
            ])