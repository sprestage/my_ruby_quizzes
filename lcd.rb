#!/usr/bin/env ruby
puts

if ARGV.count > 0
  puts "ARGUMENTS ARE PRESENT"

  # SETUP
  puts "BEGIN SETUP"
  top = ""
  between_top = ""
  middle = ""
  between_bottom = ""
  bottom = ""

  # CREATE size 1 digits
  puts "  CREATE digits, size 1"
  if ARGV.count == 1
    digits = ARGV[0]
  elsif ARGV.count == 3
    digits = ARGV[2]
  end
  print "  CREATE digits, source string of digits: "
  puts digits
  digits.each_char do |d|
  print "  CREATE digit #: "
    case d
    when "1"
      puts "1"
      top             << "   "
      between_top     << "  |"
      middle          << "   "
      between_bottom  << "  |"
      bottom          << "   "

    when "2"
      puts "2"
      top             << " - "
      between_top     << "  |"
      middle          << " - "
      between_bottom  << "|  "
      bottom          << " - "
    when "3"
      puts "3"
      top             << " - "
      between_top     << "  |"
      middle          << " - "
      between_bottom  << "  |"
      bottom          << " - "
    when "4"
      puts "4"
      top             << "   "
      between_top     << "| |"
      middle          << " - "
      between_bottom  << "  |"
      bottom          << "   "
    when "5"
      puts "5"
      top             << " - "
      between_top     << "|  "
      middle          << " - "
      between_bottom  << "  |"
      bottom          << " - "
    when "6"
      puts "6"
      top             << " - "
      between_top     << "|  "
      middle          << " - "
      between_bottom  << "| |"
      bottom          << " - "
    when "7"
      puts "7"
      top             << " - "
      between_top     << "  |"
      middle          << "   "
      between_bottom  << "  |"
      bottom          << "   "
    when "8"
      puts "8"
      top             << " - "
      between_top     << "| |"
      middle          << " - "
      between_bottom  << "| |"
      bottom          << " - "
    when "9"
      puts "9"
      top             << " - "
      between_top     << "| |"
      middle          << " - "
      between_bottom  << "  |"
      bottom          << " - "
    when "0"
      puts "0"
      top             << " - "
      between_top     << "| |"
      middle          << "   "
      between_bottom  << "| |"
      bottom          << " - "
    else
      puts "You gave me #{d} -- I have no idea what to do with that."
    end  # end case

    puts "    ADD space between digits"
    top << " "
    between_top << " "
    middle << " "
    between_bottom << " "
    bottom << " "

  end  # end digits.each_char

  puts "  CREATE COMPLETE, print to screen to demo initial setup of size one digits"
  print "    "
  puts top
  print "    "
  puts between_top
  print "    "
  puts middle
  print "    "
  puts between_bottom
  print "    "
  puts bottom
  puts "END SETUP, strings of digits of size one are ready"

  if ARGV.count == 3
    puts ARGV[0]
    puts ARGV[1]
    puts ARGV[2]

    if ARGV[0] == "-s"
      size = ARGV[1].to_i
      if size > 0
        @s = size
        while @s > 1
          puts "Size = : #{@s}.  Need to add to scale up digits"
          @s = @s - 1
        end  # end while @s > 1
      else
        puts "Size must be greater than zero"
      end  # end if size > 0
    else
      puts
      puts "Not sure what you are after.  The correct format for running this program is:"
      puts "    $ ./LCDnumbers an_integer"
      puts
      puts "or, if you would like the digit to be printed in a smaller or bigger format:"
      puts "    $ ./LCDnumbers -s 1 another_integer"
    end  # end if ARGV[0] == "-s"
  else
    # do nothing
  end  # end if ARGV.count == 1 and elsif ARGV.count == 3

  puts top
  puts between_top
  puts middle
  puts between_bottom
  puts bottom

else
  puts "Cannot display digits, no digits entered at command line."
  puts "Please run program again with a numerical arument."
end  # end if ARGV.count > 0

puts
