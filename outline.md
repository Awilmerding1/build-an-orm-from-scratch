# What is ORM

Object Relational Mapping - CONCEPT/CONVENTION



## What are the Benefits of ORM?

 - Repetition
 - Organized



## Mapping Ruby Classes to Our Database Tables

  Class - Table
  Instances - Rows
  Attributes - Columns

### Bound Parameters

Heredoc

` sql = <<-SQL
     INSERT INTO songs (name, genre)
     VALUES (?,?)
   SQL


   DB[:conn].execute("INSERT INTO songs (name, genre) VALUES (?,?)", self.name, null)
   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
`



# Building an ORM From Scratch
