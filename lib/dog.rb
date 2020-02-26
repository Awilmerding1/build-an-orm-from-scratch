class Dog
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name, age, id=nil)
    @name = name
    @age = age
    @id = id
  end

  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
      )"
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE dogs"
    DB[:conn].execute(sql)
  end

  def save
    if self.id
      self
    else
      sql = <<-SQL
        INSERT INTO dogs (name, age)
        VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.age)
      select_sql = "SELECT last_insert_rowid() FROM dogs"
      binding.pry
      @id = DB[:conn].execute(select_sql)[0][0]
    end
  end


end
