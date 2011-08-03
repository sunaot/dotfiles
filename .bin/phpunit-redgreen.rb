#! /usr/bin/env ruby
# coding: utf-8
require 'term/ansicolor'
class String
  include Term::ANSIColor
  def banner
    "\e[2K#{self}"
  end
end

banner_set = '(^PHPUnit .*)'
failure_set = '(^FAILURES!$|^Tests: \d+, Assertions: \d+, .*$)'
ok_set = '(^OK .*$)'
exception_set = '(^Exception:)'
testcase_name = '^(.*Test)$'
result_node = '(^\d+\))'
messages = '^(Warning:|PHP Fatal error:|Unexpected PHP error:|PHP Parse error:)'
puts $stdin.readlines.map {|s| 
  s.chomp!
  s.gsub!(/#{banner_set}/, '\\1'.blue.bold)
  s.gsub!(/#{ok_set}/, '\\1'.banner.on_green.white.bold)
  s.gsub!(/#{failure_set}/, '\\1'.banner.on_red.white.bold)
  s.gsub!(/#{exception_set}/, '\\1'.magenta.bold)
  s.gsub!(/#{testcase_name}/, '\\1'.cyan.bold)
  s.gsub!(/#{result_node}/, '\\1'.red.bold)
  s.gsub!(/#{messages}/, '\\1'.cyan.bold)
  s
} # do ~ end だと Enumerator が返る
