#!/usr/bin/env ruby

# require library 'open-uri'
# http://ruby.about.com/b/2008/10/23/a-quick-peek-at-ruby-include-vs-require.htm
# in ruby, "require" acts similarly to C "include"
# it imports a file, often a library like a ruby gem.
# in ruby, "include" includes methods from another module.
require 'open-uri'

# References

open("http://www.ruby-lang.org/en") do |f|
  f.each_line {|line| p line}
  # base_uri : http://www.ruby-lang.org/en/
  puts "base_uri : #{f.base_uri}"
  # content_type : text/html
  puts "content_type : #{f.content_type}"
  # charset : utf-8
  puts "charset : #{f.charset}"
  # content_encoding : []
  puts "content_encoding : #{f.content_encoding}"
  # last_modified :  
  puts "last_modified : #{f.last_modified}"
end
