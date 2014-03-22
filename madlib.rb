#!/usr/bin/env ruby

### Fix the formatting of the string, since substituting the new madlibs
###  will alter any previous formatting.  Also, this only works with
###  strings, not arrays, so think about how this is called.
def word_wrap(text, line_width = 80 )
  return text if line_width <= 0
  text.gsub(/\n/, ' ').gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip
end

### This is the pedantic, limited version of how to code madlibs.  Boring,
###  but a good place to start.  This one runs if no filename is input at
###  the command line, which is to say, if ARGV.count == 0.
def short_madlibs
  print "(a verb, past tense)   "
  madlib1 = gets.chomp
  print "(a number)   "
  madlib2 = gets.chomp
  puts
  puts "==================="
  puts "Here is your madlib"
  puts "==================="
  puts ""
  madlibs = ""
  madlibs << "I #{madlib1} to the sandwich shop across the street for lunch yesterday. I go there at least #{madlib2} times a week."
  puts word_wrap("#{madlibs}")
  puts
end

### This is the fun version where we use a file that contains a whole long
###  madlib.  This became much more complex as it went along.  The
###  additional elements that came up were:
###   - ARGV(command line arguments when running this program) conflicts
###      with STDIN.  Using ARGV.clear flushes ARGV so gets can be used
###      without having to specify $stdin.gets for Every gets which is the
###      standard work around otherwise.
###   - Careful REGEX manipulation to find the parts of speech, pull them
###      out, prompt the user for madlib, then put them back in.
###   - Remember to reformat before outputting the results, since the
###      text substitution will inevitably alter any previous formatting.
def madlibs_from_file
  if ARGV.count > 0
    filename = ARGV.first.chomp
    if (defined?(filename))
      madlibs_text = File.open(filename)
      madlibs_text = madlibs_text.read()
    end
    ARGV.clear
    puts "ORIGINAL TEXT from file #{filename}:"
    puts madlibs_text
    puts "==================="
    puts
    reusable_answers = {}
    part_of_speech_needed = ("#{madlibs_text.match(/(?<=\(\()(.*?)(?=\)\))/m)}")
    while (part_of_speech_needed != "")
      if part_of_speech_needed[0] == "a"  && ((part_of_speech_needed[1] == 'n' && part_of_speech_needed[2] == " ") || part_of_speech_needed[1] == " ")
        ### Do nothing special.  This is the default request for a part of speech
        ###  which looks like ((an adjective)) or ((a noun)).
        print "Please enter "
        print word_wrap(part_of_speech_needed)
        print " :  "
        provided_word = gets.chomp
        puts
        madlibs_text = madlibs_text.sub(/\(\(.*?\)\)/m, provided_word)
      elsif part_of_speech_needed.match(":")
        ### This is a new key/value pair.  Store in the hash.
        print "Please enter "
        print word_wrap(part_of_speech_needed)
        print " :  "
        value = gets.chomp
        puts
        key = part_of_speech_needed.match(/(.*?)(?=:)/)
        reusable_answers[("#{key}")] = ("#{value}")
        madlibs_text = madlibs_text.sub(/\(\(.*?\)\)/m, value)
      else
        ### This is an existing key.  Retrieve corresponding value from the hash.
        key = ("#{part_of_speech_needed}")
        value = reusable_answers[key]
        madlibs_text = madlibs_text.sub(/\(\(.*?\)\)/m, value)
      end
      part_of_speech_needed = ("#{madlibs_text.match(/(?<=\(\()(.*?)(?=\)\))/m)}")

    end
    puts "==================="
    puts "Here is your madlib:"
    puts "==================="
    puts word_wrap(madlibs_text)
    puts "==================="
  else
    puts "Sorry, no filename was entered."
    short_madlibs
  end
end

puts
puts "=================="
puts "Welcome to MadLibs"
puts "=================="
puts ""

madlibs_from_file

puts "BYEBYE"
puts
