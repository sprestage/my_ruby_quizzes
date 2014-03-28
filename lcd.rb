#!/usr/bin/env ruby
def add_dash(how_big)
  @size = how_big
  @dash_line = " "
  while @size > 0
    @dash_line << "-"
    @size = @size - 1
  end
  @dash_line << " "
end

def add_no_dash(how_big)
  @size = how_big
  @dash_line = " "
  while @size > 0
    @dash_line << " "
    @size = @size - 1
  end
  @dash_line << " "
end

def add_left_bar(how_big)
  @size = how_big
  @left_bar_line = "|"
  while @size > 0
    @left_bar_line << " "
    @size = @size - 1
  end
  @left_bar_line << " "
  @size = how_big
  while @size > 1
    @left_bar_line << "\n" + @left_bar_line
    @size = @size - 1
  end
  return @left_bar_line
end

def add_right_bar(how_big)
  @size = how_big
  @right_bar_line = " "
  while @size > 0
    @right_bar_line << " "
    @size = @size - 1
  end
  @right_bar_line << "|"
  @size = how_big
  while @size > 1
    @right_bar_line << "\n" + @right_bar_line
    @size = @size - 1
  end
  return @right_bar_line
end

def add_double_bar(how_big)
  # string.split("\n")
  @size = how_big
  @double_bar_line = "|"
  while @size > 0
    @double_bar_line << " "
    @size = @size - 1
  end
  @double_bar_line << "|"
  @size = how_big
  while @size > 1
    @double_bar_line = @double_bar_line + "\n" + @double_bar_line
    @size = @size - 1
  end
  print "NUMBER OF returns: "
  puts @double_bar_line.count("\n")
  print "NUMBER OF characters: "
  puts @double_bar_line.class
  c = @double_bar_line.count("")
  puts c
  return @double_bar_line
end

puts

if ARGV.count > 0

  # SETUP
  size = 1

  top = ""
  between_top = ""
  middle = ""
  between_bottom = ""
  bottom = ""

  if ARGV.count == 1
    digits = ARGV[0]
    print "DIGITS: "
    puts digits
    digits.each_char do |d|
      if d == d.to_i.to_s
        if (d == "1") || (d == "4")
          top << add_no_dash(size)
        else
          top << add_dash(size)
        end

        if (d == "5") || (d == "6")
          between_top     << add_left_bar(size)
        elsif (d == "1") || (d == "2") || (d == "3") || (d == "7")
          between_top     << add_right_bar(size)
        else
          between_top     << add_double_bar(size)
        end

        if (d == "1") || (d == "7") || (d == "0")
          middle << add_no_dash(size)
        else
          middle << add_dash(size)
        end

        if (d == "2")
          between_bottom  << add_left_bar(size)
        elsif (d == "6") || (d == "8") || (d == "0")
          between_bottom  << add_double_bar(size)
        else
          between_bottom  << add_right_bar(size)
        end

        if (d == "1") || (d == "4") || (d == "7")
          bottom << add_no_dash(size)
        else
          bottom << add_dash(size)
        end
      else
        puts "You gave me #{d} -- I have no idea what to do with that."
      end  # if d = d.to_i.to_s

      ### Put a space between each digit
      top << " "
      between_top << " "
      middle << " "
      between_bottom << " "
      bottom << " "

    end  # digits.each_char
    puts top
    puts between_top
    puts middle
    puts between_bottom
    puts bottom


  elsif ARGV.count == 3
    puts "333"
    puts ARGV[0]
    puts ARGV[1]
    puts ARGV[2]

    if ARGV[0] == "-s"
      puts "444"
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
    end  # ARGV[0] == "-s"
  else
    # do nothing
  end  # ARGV.count comparisons to 1, 3

else
  puts "Cannot display digits, no digits entered at command line."
  puts "Please run program again with a numerical arument."
end  # ARGV[0].count > 0
puts
