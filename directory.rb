students = [
["Dr. Hannibal Lecter", :november],
["Darth Vader", :november],
["Nurse Ratched", :november],
["Michael Corleone", :november],
["Alex DeLarge", :november],
["The Wicked With of the West", :november],
["Terminator", :november],
["Freddy Krueger", :november],
["The Joker", :november],
["Joffrey Baratheon", :november],
["Norman Bates", :november]
]
# and then print them

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names) #adding the array variable "students" as an argument in this method
  names.each {|student|
    puts student
  }
end

def print_footer(names)   #adding the students variable in here as argument
  puts "Overall, we have #{names.count} great students"
end
# nothing happens until we call the methods, and we do it by writing the method names below
print_header # first method in this file
print(students) #second method in this file with the students varible as an argument
print_footer(students) #third method with the students variable as an argument
