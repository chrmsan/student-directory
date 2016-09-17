def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = Array.new
  name = gets.chomp

  while !name.empty? 
    puts "Please enter the cohort month the student belongs to. Or hit return to pass if that is unknown."

    cohort = gets.chomp.downcase.to_sym    
    
    cohorts = [:january, :february, :march, :may, :june, :july, :september, :november]

    if !cohort.empty? && !cohorts.include?(cohort) then
      puts "Your entry was invalid, please try again."
      redo
    end

    puts "What is the student's gender?" 
    gender = gets.chomp.downcase.to_sym
    
    puts "What is the student's mother tongue?"
    language = gets.chomp.capitalize.to_sym
    
    puts "What is the student's country of origin?"
    country = gets.chomp.capitalize.to_sym
    

    students << {name: name, cohort: (!cohort.empty? ? cohort : :unknown), gender: gender, m_tongue: language, c_of_b: country }
    
    puts "Now we have #{students.count} #{students.count > 1 ? "students" : "student"}. Please enter a new name, or hit return to exit."
    name = gets.chomp
  end

  students
end



def print(students) 
  if students.count > 0      

      count = 1

      while count <= students.length  
        puts "#{count}. #{students[count-1][:name]} (#{students[count-1][:cohort]} cohort)" 
        count += 1  
      end
  else
    puts "Student list not available since no students were entered in the system."
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
    students.each do |student|
      if student[:cohort] == cohort
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

students = input_students
print_header(students)
print(students)
#print_by_cohort(students) 
print_footer(students) 
