# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Contact.delete_all
Contact.create(:first_name => 'Janko',
                :last_name => 'Hrasko',
                :address => 'Pod stranou 1',
                :email => 'jh@gmail.com',
                :phone => {:phone_type => "Mobil", :phone_number => "+421111111"}
               )

