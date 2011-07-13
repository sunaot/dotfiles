#! /usr/bin/env ruby
# coding: utf-8
require 'term/ansicolor'
class String
  include Term::ANSIColor
end

failure_set = '(^FAILURES!!!$|Failures: \d+)'
ok_set = '(^OK$|Passes: \d+)'
exception_set = '(^Exception \d+!|Exceptions: \d+$)'
testcase_name = '^(.*Test)$'
messages = '^(Warning:|Fatal error:|Unexpected PHP error)'
puts $stdin.readlines.map {|s| 
  s.chomp!
  s.gsub!(/#{ok_set}/, '\\1'.green)
  s.gsub!(/#{failure_set}/, '\\1'.red.bold)
  s.gsub!(/#{exception_set}/, '\\1'.magenta.bold)
  s.gsub!(/#{testcase_name}/, '\\1'.cyan.bold)
  s.gsub!(/#{messages}/, '\\1'.blue.bold)
  s
} # do ~ end だと Enumerator が返る

