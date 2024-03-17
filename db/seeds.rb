# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

organization1 = Organization.create(name: 'Software developement')
organization2 = Organization.create(name: 'Project management')


user1 = User.create(email: 'admin1@yopmail.com', password: 'admin1@123', password_confirmation: 'admin1@123', role: 'admin', mobile_number: '+919903459593')
user2 = User.create(email: 'admin2@yopmail.com', password: 'admin2@123', password_confirmation: 'admin2@123', role: 'admin', mobile_number: '+919903459594')
user3 = User.create(email: 'admin3@yopmail.com', password: 'admin3@123', password_confirmation: 'admin3@123', role: 'admin', mobile_number: '+919903459595')

p "-------------------Created users #{user1.email}, #{user2.email}, #{user3.email}-----------------------"