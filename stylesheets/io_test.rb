# ecoding: utf-8
require 'stringio'
require 'pdf/reader'
require 'prawn'
require 'pdf/inspector'
require 'pdf_reader'

output = StringIO.new('ie.css')

data = IO.read('ie.css') # return the whole string
data1 = IO.read('ie.css', 4,2) # return the specific string
data_arr = IO.readlines('ie.css')# return array
data_arrs = {}
IO.foreach("ie.css") {|w| data_arrs[w] = true}# return hash

# copy xiyouji to pdf,but the pdf file can't open
# IO.copy_stream("xiyouji.doc", "xiyouji_dev.pdf")
# copy to plain text document it's great
# IO.copy_stream("xiyouji.doc", "xiyouji")
 
  data_copy_xiyouji = IO.read('xiyouji.txt')
  puts data_copy_xiyouji.match('第一回') # 第一回
  
  array_copy_xiyouji = IO.readlines('xiyouji.txt') # 每一行为数组的一个元素
  b = array_copy_xiyouji.select {|a| a =~ /第一回/} # 第一回的标题 
  #puts b # 第一回  灵根育孕源流出 心性修持大道生
  puts array_copy_xiyouji.class
  puts b.class # Array
  puts array_copy_xiyouji.size #6736 总行数 
  output_xiyouji = StringIO.new("xiyouji.txt")
  puts output_xiyouji.class  # return StringIO
  
  c = array_copy_xiyouji.select {|a| a =~ /第.回/} # 第一到十回的标题 
  #puts c
  
  d = array_copy_xiyouji.select {|a| a =~ /第..回/} # 返回两个数字组成的标题，如，一百，十六 
  #puts d 
  
  e = array_copy_xiyouji.select {|a| a =~ /第...回/} # 返回三个数字组成的标题 
  #puts e
  
  f = array_copy_xiyouji.select {|a| a =~ /^第\S+回/} # 第一到一百回的标题 
  # puts f
  # puts f.size # 100
# 
# read a pdf file 
filename = "xiyouji-3.pdf"
# @file = Prawn::Core::DocumentState.new(:template => filename)
# puts @file.page_count # 0
@store = Prawn::Core::ObjectStore.new(:template => filename)
# puts @store.page_count # 635
puts @store.class # Prawn::Core::ObjectStore
puts @store.info # 1 0 R
# puts @store.ref
puts @store.root # 2 0 R
puts @store.pages # 3 0 R
puts @store.size # 1384
puts @store.compact
puts @store

# use Pdf inspector error EOF maker
#text = PDF::Inspector::Text.analyze(filename)
#puts text.show_text

# use pdf-reader
p = PDF::Reader.new(filename)
puts p.pages.class.to_s # Array
puts p.pages[1].class # PDF::Reader::Page
puts p.pages[1].text.class # String


#@store.each do |a| 
#  puts a
#end

# puts output
# puts data
# puts data.class
# puts data1
# puts data_arr[0]
# puts data_arr.class
# puts data_arrs

