require 'sqlite3'
require 'pry'
require_relative '../lib/dog.rb'
require_relative '../lib/dog_controller.rb'

DB = {conn: SQLite3::Database.new('db/pets.db')}

Dog.create_table

d = Dog.new("Fido", 12)
d.save
