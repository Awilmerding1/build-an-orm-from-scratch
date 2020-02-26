require 'sqlite3'
require 'pry'
require_relative '../lib/dog.rb'
require_relative '../lib/dog_controller.rb'

DB = {conn: SQLite3::Database.new('db/pets.db')}

Dog.create_table

Dog.create('Fido', 1) if !Dog.find_by_name('Fido')
Dog.create('Fluffy', 8) if !Dog.find_by_name('Fluffy')
Dog.create('Sandy', 5) if !Dog.find_by_name('Sandy')
