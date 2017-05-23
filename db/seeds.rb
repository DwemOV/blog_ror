# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'admin@example.com', password: '012345678', password_confirmation: '012345678', role: 0)
User.create!(email: 'moderator@example.com', password: '012345678', password_confirmation: '012345678', role: 1)
User.create!(email: 'users@example.com', password: '012345678', password_confirmation: '012345678', role: 2)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Item.create!(title: 'first', description: 'first',user: User.first)
Item.create!(title: 'ddfdsfdsf', description: 'fifdsfdsfrst',user: User.first)
Item.create!(title: 'fdsfdsfdsfds', description: 'fdsfdsfdsf',user: User.first)
 # 50.times { FactoryGirl.create(:item) }