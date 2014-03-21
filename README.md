MadLibs README
=======

This is a madlibs game that runs at your unix command line, using the following syntax:
<pre>
  $> ./madlib.rb
</pre>

Note: You might need to make the file executable before you can run that last command:
<pre>
  $> chown 755 ./madlib.rb
</pre>

If you have a text file with madlibs in it, you can use that instead for a much improved madlibs experience:
<pre>
  $> ./madlib.rb Gift_Giving.madlib
</pre>

You will find two madlib files included as examples.
<pre>
  Gift_Giving.madlib
  Lunch_Hungers.madlib
</pre>

The simple version is short and just uses strings, puts, and gets.

The complex, interesting version loads up madlibs from a file and dumps the file to the output.

To be implemented:

Madlibs contains examples of
=======

######STDIN
- CLI input/output using gets (which conflicts with ARGV, btw)

######ARGV
- CLI arguments, ARGV

######FILE
- opening and reading from a file

######STRING
- using variables in strings
- setting vs appending to strings
- reformat strings to 80 chars, paying attention to not breaking up words

######REGEX
- using regex to pull out strings the begin/end with given substrings
- using regex to replace substrings