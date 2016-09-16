def print_header
  puts "The students of Villains Academy".center(50)
  puts "".center(50, '-')
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# create an empty array
  students = Array.new
# get the first name
  name = gets.chomp
# while the name is not empty repeat ths code
  while !name.empty? 
#given that name variable is not empty, it is put as a key in the name: symbol inside a hash. And the hash itself is an object to the array students.
    students << {name: name, cohort: :november, hobbies: :hobbies, c_of_b: :country, height: :height }
    puts "Now we have #{students.count} students"
# and the code starts again where it asks for another name from the user
    name = gets.chomp
  end
# return the array of students
  students
end

def print(students) # default name of argument to the method print is only a name
    count = 1
    while count <= students.length   # alternatively it is possible to use until-loop "until count > students.length"
      puts "#{count}. #{students[count-1][:name]} (#{students[count-1][:cohort]} cohort)" #added +1 to index i so the index would start at 1."
      count += 1  
    end 
end

def print_footer(students) # counts the objects inside the students array
  puts "".center(50, '-')
  puts "Overall, we have #{students.count} great students!".center(50)
  puts "".center(50, '-')
end

students = input_students # sets the input_student method as the variable students
print_header
print(students) # students variable is put in as an argument in the print method
print_footer(students) # students varibale is put in as an argument in the print method that method ends, and print_footer method would activite and count the return value of students from input students method
