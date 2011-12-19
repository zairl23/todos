# ecoding: utf-8
require "prawn"
require "pdf/reader"

describe "" do
  before(:each) do
    @data = IO.readlines("./stylesheets/xiyouji.txt")# 读取的包含每行文字的数组
    @items = @data.select { |data| data =~ /^第\S+回/ } # 通过match找出标题文字并且保存在另一个数组中
    @reader = PDF::Reader.new("./stylesheets/xiyouji-3.pdf")
    @page_count = @reader.page_count # 总页数
    @num = []
  end
  describe "items" do
    it "should return @data @items" do
      @data.should be_kind_of(Array)
      @items.should be_kind_of(Array)
    end
  end
  describe "@reader" do
    it "should return pages" do
      @reader.pages.should be_kind_of(Array)
    end
    it "should return page" do
      #@reader.pages.each do |page|
      #  page.number.should == 1 if page.text == ""
      #end
      @reader.pages.include?("").should == false
    end
    it "should return page(1) nothing in it" do
      @reader.page(1).text.should == ""
    end
    it "should return page 2" do
      item = @items[0]
      @reader.page(2).text.include?(item).should == true
    end
    
  describe "outline condition" do
    it "should return page 2 in @item[0]" do
      item = @items[0]
      (1..3).each do |i|
        if @reader.page(i).text =~ /^#{item}/
        #if @reader.page(i).text.include?(item)
           @num = @reader.page(i).number
           break  # use breake reduce the time
        end
      end
      @num.should == 2
    end
    it "test 8" do
      items = []
      items << @items[1]
      num = []
      items.each do |item|
        (1..10).each do |i|
          if @reader.page(i).text =~ /^#{item}/
            num << @reader.page(i).number
            items.shift
            break
          end
        end
      end
      num.should == [8]
    end
    it "should return page 8 in @item[1]" do
      items = []
      items << @items[0] << @items[1]
      num = []
      items.each do |item|
        (1..10).each do |i|
          if @reader.page(i).text =~ /^#{item}/
          #if @reader.page(i).text.include?(item)
             num << @reader.page(i).number
             items.shift
             break  # use breake reduce the time,the time is add by the items[index] adding
          end
        end
        
      end
      items.should == ["第二回  悟彻菩提真妙理 断魔归本合元神\n"]
      num.should == [2, 8]

    end
   # it "should return page num in @item(i)" do
      #@pages = @reader.pages.select! { |p| p =~ /^#{item[0]}/ } 
   #   @i = 1    
    #  @items.each do |item|
     #   (@i..10).each do |i|
      #    if @reader.page(i).text.include?(item)
       #     @num << @reader.page(i).number
        #    @items.shift
            
         #   break
          #end
        #end
      #end
      #@num.should == []
    #end
  end 
end
end
