#!/usr/bin/env ruby
puts

if ARGV.count > 0

  # SETUP
  size = 2
  top = ""
  between_top = ""
  middle = ""
  between_bottom = ""
  bottom = ""

  # CREATE size 1 digits
  if ARGV.count == 1
    digits = ARGV[0]
    puts "No size given, presuming default size of 2."
    puts
  elsif ARGV.count == 3
    digits = ARGV[2]
  end
  digits.each_char do |d|
    case d
    when "1"
      top             << "   "
      between_top     << "  |"
      middle          << "   "
      between_bottom  << "  |"
      bottom          << "   "

    when "2"
      top             << " - "
      between_top     << "  |"
      middle          << " - "
      between_bottom  << "|  "
      bottom          << " - "
    when "3"
      top             << " - "
      between_top     << "  |"
      middle          << " - "
      between_bottom  << "  |"
      bottom          << " - "
    when "4"
      top             << "   "
      between_top     << "| |"
      middle          << " - "
      between_bottom  << "  |"
      bottom          << "   "
    when "5"
      top             << " - "
      between_top     << "|  "
      middle          << " - "
      between_bottom  << "  |"
      bottom          << " - "
    when "6"
      top             << " - "
      between_top     << "|  "
      middle          << " - "
      between_bottom  << "| |"
      bottom          << " - "
    when "7"
      top             << " - "
      between_top     << "  |"
      middle          << "   "
      between_bottom  << "  |"
      bottom          << "   "
    when "8"
      top             << " - "
      between_top     << "| |"
      middle          << " - "
      between_bottom  << "| |"
      bottom          << " - "
    when "9"
      top             << " - "
      between_top     << "| |"
      middle          << " - "
      between_bottom  << "  |"
      bottom          << " - "
    when "0"
      top             << " - "
      between_top     << "| |"
      middle          << "   "
      between_bottom  << "| |"
      bottom          << " - "
    else
      puts "You gave me #{d} -- I have no idea what to do with that."
    end  # end case

    top << "x"
    between_top << "x"
    middle << "x"
    between_bottom << "x"
    bottom << "x"

  end  # end digits.each_char

  if ARGV.count == 3

    if ARGV[0] == "-s"
      size = ARGV[1].to_i
      if size < 1
        size = 2
        puts "Size must be greater than zero.  Using default size of: #{size}."
      end  # end size < 1
    else
      puts
      puts "Not sure what you are after.  The correct format for running this program is:"
      puts "    $ ./lcd.rb an_integer"
      puts
      puts "or, if you would like the digit to be printed in a smaller or bigger format:"
      puts "    $ ./lcd.rb -s 1 another_integer"
    end  # end if ARGV[0] == "-s"

  else
    # do nothing
  end  # end if ARGV.count == 3

  little_dash = ("-" * size)
  little_space = (" " * size)
  little_bar = "|"
  little_both =    "|_|x"

  big_dash =    " " + little_dash + " x"
  big_space =   " " + little_space + " x"
  big_left =    little_bar + little_space + " x"
  big_right =   " " + little_space + little_bar + "x"
  big_both =    little_bar + little_space + little_bar + "x"

  top = top.gsub(" - x", big_dash)
  top = top.gsub("   x", big_space)

  between_top = between_top.gsub("|  x", big_left)
  between_top = between_top.gsub("  |x", big_right)
  between_top = between_top.gsub("| |x", big_both)
  @s = size
  new_between_top = between_top
  while @s > 1
    new_between_top = new_between_top + "\n" + between_top
    @s = @s - 1
  end

  middle = middle.gsub(" - x", big_dash)
  middle = middle.gsub("   x", big_space)

  between_bottom = between_bottom.gsub("|  x", big_left)
  between_bottom = between_bottom.gsub("  |x", big_right)
  between_bottom = between_bottom.gsub("| |x", big_both)
  @s = size
  new_between_bottom = between_bottom
  while @s > 1
    new_between_bottom = new_between_bottom + "\n" + between_bottom
    @s = @s - 1
  end

  bottom = bottom.gsub(" - x", big_dash)
  bottom = bottom.gsub("   x", big_space)

  top = top.gsub("x", " ")
  between_top = new_between_top.gsub("x", " ")
  middle = middle.gsub("x", " ")
  between_bottom = new_between_bottom.gsub("x", " ")
  bottom = bottom.gsub("x", " ")

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

