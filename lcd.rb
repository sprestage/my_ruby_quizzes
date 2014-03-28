#!/usr/bin/env ruby
puts

if ARGV.count > 0

  # SETUP
  top = ""
  between_top = ""
  middle = ""
  between_bottom = ""
  bottom = ""

  if ARGV.count == 1
    digits = ARGV[0]
    puts digits
    digits.each_char do |d|
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
      end
      top << " "
      between_top << " "
      middle << " "
      between_bottom << " "
      bottom << " "

    end
    puts top
    puts between_top
    puts middle
    puts between_bottom
    puts bottom


  elsif ARGV.count == 3
    puts ARGV[0]
    puts ARGV[1]
    puts ARGV[2]

    if ARGV[0] == "-s"
      puts "TO BE IMPLEMENTED"
      # Do the stuff
      size = ARGV[1]
      case size
      when "1"
        puts ("size1 = #{size}")
      when "2"
        puts ("size2 = #{size}")
      when "3"
        puts ("size3 = #{size}")
      when "4"
        puts ("size4 = #{size}")
      else
        puts ("size isn't 1-4")
      end
    else
      puts
      puts "Not sure what you are after.  The correct format for running this program is:"
      puts "    $ ./LCDnumbers an_integer"
      puts
      puts "or, if you would like the digit to be printed in a smaller or bigger format:"
      puts "    $ ./LCDnumbers -s 1 another_integer"
    end
  else
    # do nothing
  end

else
  puts "Cannot display digits, no digits entered at command line."
  puts "Please run program again with a numerical arument."
end
puts
