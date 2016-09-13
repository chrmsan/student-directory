students = [    #this is an array where each object in the array is a hash, with two keys and each key has a value
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked With of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
# and then print them

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each {|student|        # here each object in the students array is called for, and the keys of the hash of each object is printed  in the print command puts  through interpolation 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
        }
end

def print_footers(students)   #adding the students variable in here as argument
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods, and we do it by writing the method names below
print_header # first method in this file
print(students) #second method in this file with the students varible as an argument
print_footers(students) #third method with the students variable as an argument
