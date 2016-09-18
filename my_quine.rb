ma_sourz_kode = String.new                        # Create an empty string

File.open("./my_quine.rb", "r") do |file|         # open/read and creates object file of the program 
  file.each_line do |line|                        # takes each_line of the program
    ma_sourz_kode << line                         # and concat each line in the ma_sourz_kode variable string
  end
end

puts ma_sourz_kode                                # prints  ma_sourz_kode, and effectively prints the source code of this source code
                                                  # and even these comments :D
