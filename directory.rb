def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = Array.new          # create array
  name = gets.chomp             # prompts the name

  while !name.empty?            # if user enters a name, the following code will work 
    puts "Please enter the cohort month the student belongs to. Or hit return to pass if that is unknown."

    cohort = gets.chomp.downcase.to_sym    # prompts cohort month, makes it lowercase and makes into symbol
    
    cohorts = [:january, :february, :march, :may, :june, :july, :september, :november]        # array actual cohort months at Makers Academy in lower case symbol format

    if !cohort.empty? && !cohorts.include?(cohort) then       # if user enters a cohort month, but the prompt is does not match objects in cohorts array, activates the redo loop and it prints below code and, reprints above cohort print
      puts "Your entry was invalid, please try again."
      redo
    end

    puts "What is the student's gender?" 
    gender = gets.chomp.downcase.to_sym   # prompts gnder, makes it lowercase and makes into symbol
      
    puts "What is the student's mother tongue?"  # prompts language, makes it lowercase and makes into symbol
    language = gets.chomp.capitalize.to_sym
    
    puts "What is the student's country of origin?"  # prompts country, makes it lowercase and makes into symbol
    country = gets.chomp.capitalize.to_sym
    
    students << {name: name, cohort: (!cohort.empty? ? cohort : :unknown), gender: gender, m_tongue: language, c_of_b: country }  # above variables are pushed inside as key values inside a hash representing a student, and each hash is an object inside the students array. For the cohort: key, the value is inside a ternary operator, where the prompted cohort value is returned if the cohort variable is not empty, and if it is :cohort value is defaulted to :unknown
    
    puts "Now we have #{students.count} #{students.count > 1 ? "students" : "student"}. Please enter a new name, or hit return to exit."   # the print is interpolated on how many students there are in the array, and if there are more than 1 student the sentence will change accordingly."
    name = gets.chomp #   name prompt is activated again
  end

  students   # returns the array of student hashes
end



def print(students) 
  if students.count > 0      # below print code is activated if there are any students in the list

      count = 1     # a counter variable for the while loop

      while count <= students.length   # while will continue to loop until the count variable reaches the same number of students 
        puts "#{count}. #{students[count-1][:name]} (#{students[count-1][:cohort]} cohort)"  # in this string we interpolate straight from the students array
        count += 1  # each time the while loop is activated, count varibale incraeases by 1
      end
  else   # if there are no students, below string will be printed
    puts "Student list not available since no students were entered in the system.".center(50) 
    puts "".center(50, '-')   
  end 
end



def print_by_cohort(students)
  if students.count > 0
    puts "".center(50, '-')
    puts "Here we will print out students from a specific cohort"
    puts "Please enter cohort month of the relevant group of students"
    cohort = gets.chomp.downcase.to_sym
    puts "Students belonging to the #{cohort.capitalize} cohort of Villains Academy".center(50)
    puts "".center(50, '-')
    students.each do |student|    # each method activates below code for each object in the students array and calls the object for student
      if student[:cohort] == cohort   # if each object student of students array's :cohort value mathches with cohort prompted variable, print below interpolated string 
        puts "- #{student[:name]}, is #{student[:gender]}, who speaks #{student[:m_tongue]}, and is from #{student[:c_of_b]}"
      end
    end
  else
    puts "Cohort student list not available since no students were entered in the system."
    puts "".center(50, '-')
  end      
end



def print_header(students)
  if students.count > 0  
    puts "The students of Villains Academy".center(50)
    puts "".center(50, '-')
  end
end



def print_footer(students) 
  if students.count > 0
    puts "".center(50, '-')
    puts "Overall, we have #{students.count} great #{students.count > 1 ? "students" : "student"}!".center(50)
    puts "".center(50, '-')
  end
end



def interactive_menu
  # 1. print the menu and ask the user what to do
  # 2. read the input and save it into a variable
  # 3. do what the user has asked
  # 4. repeat from step 1
end



students = input_students   # creates a local variable called students that is equal to the method input_students, and there be equal to the students array of student hashes
print_header(students)      # method calls above students variable
print(students)
#print_by_cohort(students) 
print_footer(students) 
