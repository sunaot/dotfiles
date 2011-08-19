#!/usr/bin/env ruby
#
# rdefs.rb を PHP 用に改変. rdefs.rb のオリジナルは以下から取得.
# <http://i.loveruby.net/svn/public/bin/trunk/rdefs.rb>
# $Id$

require 'optparse'

CLASS_RE = /\A\s*(?:
    class\s | interface\s | require[\s\(] | require_once[\s\(] | include[\s\(] | include_once[\s\(]
  )/x

DEF_RE = /\A\s*
  (?: function\s
    | class\s
    | interface\s
    | include\b
    | include_once\b
    | require\b
    | require_once\b
    | var\b
    | public\b
    | private\b
    | protected\b
    | static\b
    | global\b
    )/x

PUBLIC_RE = /\A\s*
  (?: function\s
    | class\s
    | interface\s
    | include\b
    | include_once\b
    | require\b
    | require_once\b
    | var\b
    | public\b
    | static\s+function\b
    | static\s+public\b
    | global\b
    )/x

def main
  re = DEF_RE
  print_line_number_p = false
  parser = OptionParser.new
  parser.banner = "#{File.basename($0)} [-n] [file...]"
  parser.on('--class', 'Show only classes and modules.') {
    re = CLASS_RE
  }
  parser.on('--public', 'Show only public classes, modules and methods.') {
    re = PUBLIC_RE
  }
  parser.on('-n', '--lineno', 'Prints line number.') {
    print_line_number_p = true
  }
  parser.on('--help', 'Prints this message and quit.') {
    puts parser.help
    exit 0
  }
  begin
    parser.parse!
  rescue OptionParser::ParseError => err
    $stderr.puts err.message
    exit 1
  end

  f = Preprocessor.new(ARGF)
  while line = f.gets
    if re =~ line
      printf '%4d: ', f.lineno if print_line_number_p
      print getdef(line, f)
    end
  end
end

def getdef(str, f)
  until balanced?(str)
    line = f.gets
    break unless line
    str << line
  end
  str
end

def balanced?(str)
  s = str.gsub(/'.*?'/, '').gsub(/".*?"/, '')
  s.count('(') == s.count(')')
end

class Preprocessor
  def initialize(f)
    @f = f
  end

  def gets
    line = @f.gets
    if /\/\*\s/ =~ line
      while line = @f.gets
        break if /\*\/\s/ =~ line
      end
      line = @f.gets
    end
    line
  end

  def lineno
    @f.lineno
  end
end

main

