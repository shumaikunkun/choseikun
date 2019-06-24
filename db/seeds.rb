# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#例
# Shosai.create(:name=>"shuma",:key=>"7/20-10",:value=>1)
# Shosai.create(:name=>"shuma",:key=>"7/20-11",:value=>0)

Daymodel.create(:day=>"8/25", :num=>0)
Daymodel.create(:day=>"8/26", :num=>0)
Daymodel.create(:day=>"8/27", :num=>0)
Daymodel.create(:day=>"8/28", :num=>0)
Daymodel.create(:day=>"8/29", :num=>0)
Daymodel.create(:day=>"8/30", :num=>0)

Hourmodel.create(:hour=>"13", :num=>0)
Hourmodel.create(:hour=>"14", :num=>0)
Hourmodel.create(:hour=>"15", :num=>0)
Hourmodel.create(:hour=>"16", :num=>0)
Hourmodel.create(:hour=>"17", :num=>0)
Hourmodel.create(:hour=>"18", :num=>0)
Hourmodel.create(:hour=>"19", :num=>0)
Hourmodel.create(:hour=>"20", :num=>0)
