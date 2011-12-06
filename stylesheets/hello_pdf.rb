# encoding: utf-8
require "prawn"

Prawn::Document.generate("hello.pdf") do
  font("#{Prawn::BASEDIR}/data/fonts/simsun.ttf", :size => 16) do
    hanzi_text = "我是章磊，这是中国简体汉字,它们是宋体。"
    text hanzi_text
  end
  font("#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf", :size => 16) do
    gkai_text = "我是章磊，这是中国简体汉字，它们是楷体。"
    text gkai_text
  end
end
