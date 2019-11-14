# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

char1 = Character.create!(name:'Bilbo', character_class:'Warlock', level:17, background:'Street Urchin', race:'Elf', alignment:'Good', experience:450, armor_class:4,speed:45, max_hp:900,current_hp: 600,temporary_hp:400,saves_success:2,saves_failures:1,strength:5,dexterity:13,constitution:14,intelligence:19,wisdom:9,charisma:2,inspiration:23,proficiency:11)