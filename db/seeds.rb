# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
salt = Admin.random_string(10)
password = "password"
Admin.create(:username => 'admin', :hashed_password => Admin.encrypt(password, salt), :salt => salt)