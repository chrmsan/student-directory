def print_header
  puts "The students of Villains Academy".center(50)
  puts "".center(50, '-')
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = Array.new
  name = gets.chomp

  while !name.empty? 
    puts "Please enter the cohort month the student belongs to. Or hit return to pass."

    cohort = gets.chomp.downcase.to_sym    
    
    cohorts = [:january, :february, :march, :may, :june, :july, :september, :november]
  
    students << {name: name, cohort: (cohorts.include?(cohort) ? cohort : :unknown), hobbies: :hobbies, c_of_b: :country, height: :height }
    puts "Now we have #{students.count} students. Please enter a new name, or hit return to exit."
    name = gets.chomp
  end

  students
end

def print(students) 
    count = 1

    while count <= students.length  
      puts "#{count}. #{students[count-1][:name]} (#{students[count-1][:cohort]} cohort)" 
      count += 1  
    end 

end

def print_footer(students) 
  puts "".center(50, '-')
  puts "Overall, we have #{students.count} great students!".center(50)
  puts "".center(50, '-')
end

students = input_students
print_header
print(students) 
print_footer(students) 
