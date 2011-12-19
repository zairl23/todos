# ecoding: utf-8
require 'pdf/reader'
describe "PDF::Reader" do
  before(:each) do
    @filename_nobg = './stylesheets/hello.pdf' # 这是一个没有背景图片的pdf文件
    @filename_bg = './stylesheets/xiyouji.pdf'  # 这是一个有背景图片的pdf文件
    @p_nobg = PDF::Reader.new(@filename_nobg)
    @p_bg = PDF::Reader.new(@filename_bg)
    
  end
     
  describe "nobg PDF" do
    it "should return file's text on page 1" do
      @p_nobg.page(1).class.to_s.should == "PDF::Reader::Page"
      @p_nobg.page(1).text.should       == "我是章磊，这是中国简体汉字,它们是宋体。\n我是章磊，这是中国简体汉字，它们是楷体。"
      @p_nobg.page(1).to_s.should       == @p_nobg.page(1).text
    end
    it "should return objects" do
      @p_nobg.objects.size.should == 20 
      @p_nobg.objects.class.should == PDF::Reader::ObjectHash
      #@p_nobg.objects.[](1).should == {:Creator=>"\xFE\xFF\x00P\x00r\x00a\x00w\x00n", :Producer=>"\xFE\xFF\x00P\x00r\x00a\x00w\x00n"}
      #@p_nobg.objects.[](4).should == {}
      #@p_nobg.streams.should == {} # no method 
    end
  end
  
  describe "bg PDF" do
    it "should return file's text on page1" do
      @p_bg.page(1).class.to_s.should == "PDF::Reader::Page"
      #@p_bg.page(1).to_s.should == ""
      #@p_bg.page(1).should ==  <PDF::Reader::Page page: 1> 
    end
    it "should raw_content" do
      @p_bg.page(1).raw_content.should be_a_kind_of(String)
      
    end
    it "should xobjects" do
      @p_bg.page(1).xobjects.should be_kind_of(Hash)
      @p_bg.page(1).xobjects.size.should == 1
      @p_bg.page(1).xobjects.should == {}
    end
  end
  

end

