class Dog

  attr_accessor :name, :age
  attr_reader :id


  def initialize(name, age=nil, id=nil)
    @name = name
    @age = age
    @id = id
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      age INTEGER
      )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE dogs"
    DB[:conn].execute(sql)
  end

  def self.create(name, age=nil)
    dog = Dog.new(name, age)
    dog.save
    dog
  end

  def self.all
    DB[:conn].execute("SELECT * FROM dogs").map do |dog|
      self.new_from_db(dog)
    end
  end

  def self.new_from_db(row)
    new_dog = self.new(row[1], row[2], row[0])
    new_dog
  end

  def self.find_by_name(name)

      sql = <<-SQL
       SELECT *
       FROM dogs
       WHERE name = ?
       LIMIT 1
     SQL

     DB[:conn].execute(sql,name.capitalize).map do |row|
       self.new_from_db(row)
     end.first


    # self.all.detect do |dog|
    #   dog.name.downcase == name.downcase
    # end
  end


  def save
    if self.id
      self
    else
     sql = <<-SQL
       INSERT INTO dogs (name, age)
       VALUES (?,?)
     SQL
     DB[:conn].execute(sql, self.name, self.age)
     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
   end
   end

   def update
    sql = <<-SQL
      UPDATE dogs
      SET name = ?
      WHERE id = ?
    SQL
    DB[:conn].execute(sql, self.name, self.id)

  end


end
