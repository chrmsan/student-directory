@students = Array.new   #instance variable named students that is an array

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp             # prompts the name

  while !name.empty?            # if user enters a name, the following code will work 

    puts "Please enter the cohort month the student belongs to. Or hit return to pass if that is unknown."

    cohort = STDIN.gets.chomp.downcase    # prompts cohort month, makes it lowercase and makes into symbol
  
    cohorts = [:january, :february, :march, :may, :june, :july, :september, :november]
  
    if !cohort.empty? && !cohorts.include?(cohort.to_sym) then
      puts "Your entry was invalid, please try again"
      redo
    end
    
    additional_info
    
    add_student(name, cohort, @gender, @language, @country)  # above variables are pushed inside as key values inside a hash representing a student, and each hash is an object inside the students array. For the cohort: key, the value is inside a ternary operator, where the prompted cohort value is returned if the cohort variable is not empty, and if it is :cohort value is defaulted to :unknown
    
    puts "Now we have #{@students.count} #{is_plural}. Please enter a new name, or hit return to go back to the menu."   # the print is interpolated on how many students there are in the array, and if there are more than 1 student the sentence will change accordingly."


    name = STDIN.gets.chomp #   name prompt is activated again
  end

  @students   # returns the array of student hashes
end



def additional_info
    puts "What is the student's gender?" 
    @gender = STDIN.gets.chomp.downcase   # prompts gnder, makes it lowercase and makes into symbol
      
    puts "What is the student's mother tongue?"  # prompts language, makes it lowercase and makes into symbol
    @language = STDIN.gets.chomp.capitalize
    
    puts "What is the student's country of origin?"  # prompts country, makes it lowercase and makes into symbol
    @country = STDIN.gets.chomp.capitalize
end



def is_plural
  @students.count > 1 ? "students" : "student"
end



def print_students_list 
  if @students.count > 0      # below print code is activated if there are any students in the list

      count = 1     # a counter variable for the while loop

      while count <= @students.length   # while will continue to loop until the count variable reaches the same number of students 
        puts "#{count}. #{@students[count-1][:name]} (#{@students[count-1][:cohort]} cohort)"  # in this string we interpolate straight from the students array
        count += 1  # each time the while loop is activated, count varibale incraeases by 1
      end
  else   # if there are no students, below string will be printed
    puts "Student list not available since no students were entered in the system.".center(50) 
    print_line
  end 
end



def print_by_cohort
  if @students.count > 0
    print_line
    puts "Here we will print out students from a specific cohort"
    puts "Please enter cohort month of the relevant group of students"
    cohort = gets.chomp.downcase.to_sym
    puts "Students belonging to the #{cohort.capitalize} cohort of Villains Academy".center(50)
    print_line
    @students.each do |student|    # each method activates below code for each object in the students array and calls the object for student
      if student[:cohort] == cohort   # if each object student of students array's :cohort value mathches with cohort prompted variable, print below interpolated string 
        puts "- #{student[:name]}, is #{student[:gender]}, who speaks #{student[:m_tongue]}, and is from #{student[:c_of_b]}"
      end
    end
  else
    puts "Cohort student list not available since no students were entered in the system."
    print_line
  end      
end

def print_line
  puts "".center(50, '-')
end

def print_header
  if @students.count > 0  
    puts "The students of Villains Academy".center(50)
    print_line
  end
end



def print_footer 
  if @students.count > 0
    print_line
    puts "Overall, we have #{@students.count} great #{is_plural}!".center(50)
    print_line
  end
end



def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save current list"
  puts "4. Load a list:"
  puts "9. Exit"
end



def show_students
  print_header
  print_students_list
  print_footer
end



def process(selection)
  case selection
    when "1"
      puts "|ACTIVATING INPUT PROGRAM|"
      input_students
    when "2"
      puts "|ACTIVATING STUDENT LIST|"
      show_students
    when "3"
      request_filename(selection)
    when "4"
      request_filename(selection)
    when "9"
      puts "|EXITING MAIN PROGRAM|"  
      exit
    else
      print_line
      puts "***What the hell was that? Please try again!***"
      print_line
  end
end 


   
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end



def save_students(filename)
  # open the file for writing
  file = File.open(filename, "w")     # open as in create a file?
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:gender], student[:m_tongue], student[:c_of_b]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "\"#{filename}\" has been saved"
end



def request_filename(selection)
  puts "Please enter a filename: "
  filename = STDIN.gets.chomp
  selection == "3" ? save_students(filename) : load_students(filename)
  end



def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, gender, language, country = line.chomp.split(',')
    add_student(name, cohort, gender, language, country)
  end
  file.close
  puts "\"#{filename}\" has been uploaded to the program"
end



def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil?
  if File.exists?(filename) #if argument exist
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end



def add_student(name, cohort, gender, language, country)
  @students << {name: name, cohort: (!cohort.empty? ? cohort.to_sym : :unknown), gender: gender.to_sym, m_tongue: language.to_sym, c_of_b: country.to_sym}
end


try_load_students
interactive_menu


#students = input_students   # creates a local variable called students that is equal to the method input_students, and there be equal to the students array of student hashes
#print_header(students)      # method calls above students variable
#print(students)
#print_by_cohort(students) 
#print_footer(students) 
