# ecoding: utf-8
require "prawn"
require "pdf/reader"
# add outlines
Prawn::Document.generate("xiyouji-4.pdf", :template => "xiyouji-3.pdf") do 
  @data = IO.readlines("xiyouji.txt")# 读取的包含每行文字的数组
  @items = @data.select { |data| data =~ /^第\S+回/ } # 通过match找出标题文字并且保存在另一个数组中

  @reader = PDF::Reader.new("xiyouji-3.pdf")
  @reader.pages.each do |page|
   
    @items.each do |item|
      if page.text =~ /^#{item}/ # must add .text to string,page is a Pdf::Reader::Page
        outline.define do
          section(item, :destinatin => page.number)
        end
      end
    end
  end
end

