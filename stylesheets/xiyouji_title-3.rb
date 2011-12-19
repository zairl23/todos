# encoding: utf-8
# 将标题和正文采用不同的字体大小以示区别，并且对于每个标题，必须重起新的一页，不过还是有缺点的
# 收行还没有缩进，而且还没有一个导航的页面
require "prawn"
require "pdf/reader"
#require "stringio"
#img    = "/home/ney/todos/images/bg.jpg" # 背景图片路径:background => img
# @data 和 @items必须在Prawn后再创建
# @data  = IO.readlines("xiyouji") # 读取的包含每行文字的数组
# @items = @data.select { |data| data =~ /^第\S+回/ } # 通过match找出标题文字并且保存在另一个数组中

Prawn::Document.generate("xiyouji-3.pdf", :margin => 60) do
  # @data = IO.readlines("西游记.doc") #  invalid byte sequence in UTF-8 (ArgumentError)
  @data = IO.readlines("xiyouji.txt")# 读取的包含每行文字的数组
  @items = @data.select { |data| data =~ /^第\S+回/ } # 通过match找出标题文字并且保存在另一个数组中
  @data.each do |data|
    if @items.include?(data) # 判断是否是标题文字
      start_new_page # 重新开起新页
      font("#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf", :size => 20 ) do
        content = data
        text content
      end
    else
      font("#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf", :size => 14 ) do
        content = data
        text content
      end
    end
  end 
  # add outlines
  @pages = PDF::Reader.new("xiyouji-3.pdf").pages do |page|
    @items.each do |item|
      if page.include?(item)
        outline.define do
          section(item, :destinatin => page.number)
        end
      end
    end
  end
  
end

