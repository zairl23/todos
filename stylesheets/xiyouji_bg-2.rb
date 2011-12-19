# encoding: utf-8
# 给书本添加了一个背景图片
require "prawn"
#require "stringio"
img = "/home/ney/todos/images/bg.jpg"
Prawn::Document.generate("xiyouji-2.pdf", :background => img, :margin => 60) do
  font("#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf", :size => 14) do
    content = IO.read("xiyouji")
    text content
  end
end
