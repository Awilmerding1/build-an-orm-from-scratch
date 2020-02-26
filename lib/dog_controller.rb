class DogController

  def run
    puts "Welcome!"
    menu
  end

  def dog_list
    Dog.all.each do |dog|
      puts dog.name
    end
    update_dog
    menu
  end

  def add_dog
    puts 'To add a dog, please enter a name'
    puts "To return home enter 'menu'"
    input = gets.strip
    if input == 'menu'
      menu
    end
    Dog.create(input)
    menu
  end

  def menu
    puts "To see a list of dogs enter 'list'"
    puts "To add a new dog enter 'add'"
    puts "To exit enter 'exit'"
    input = gets.strip
    if input == 'list'
      dog_list
    elsif input == 'add'
      add_dog
    elsif input == 'exit'
      exit
    else
      menu
    end
  end

  def update_dog
    puts 'To change a dog name, please select a dog'
    puts "To return home enter 'menu'"
    input = gets.strip
    if input == 'menu'
      menu
    end
    dog = Dog.find_by_name(input)
    puts 'Please enter the new name'
    input = gets.strip
    dog.name = input
    dog.update
    puts "The name has been changed to #{dog.name}"
    menu
  end

  def exit
    abort('Bye!')
  end


end
