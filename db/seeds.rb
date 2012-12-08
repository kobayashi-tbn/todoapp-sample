# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Roles create
Role.create(role_id: 0, name: 'user', notice: 'User')
Role.create(role_id: 1, name: 'admin', notice: 'Administrator')
Role.create(role_id: 2, name: 'sysadmin', notice: 'System Administrator')
