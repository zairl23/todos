# coding: utf-8
require 'pdf/reader'

describe "PDF::Reader::Stream" do
  before(:each) do
    @filename_nobg = './stylesheets/hello.pdf' # 这是一个没有背景图片的pdf文件
    @filename_bg   = './stylesheets/xiyouji.pdf'  # 这是一个有背景图片的pdf文件
    @p_nobg        = PDF::Reader.new(@filename_nobg)
    #@s_nobg = PDF::Reader::Stream.new(@filename_nobg) # no arguments
    @s_nobg        = @p_nobg.objects.[](4)  # PDF::Reader::Stream
    @page_nobg     = @p_nobg.objects.[](5) # Hash type=page
    
    #@p_bg = PDF::Reader::Stream.new(@filename_bg)
  end
  
  describe "nobg PDF" do
    it "should return class name" do
      @s_nobg.class.to_s.should == "PDF::Reader::Stream"
    end
    it "should return data" do
      @s_nobg.data.should == "q\n\nBT\n36 742.256 Td\n/F1.1 16 Tf\n<212223242526222728292a2b2c> Tj\n/F1.0 16 Tf\n<2c> Tj\n/F1.1 16 Tf\n<2d2e222f2a30> Tj\nET\n\n\nBT\n36 723.728 Td\n/F3.1 16 Tf\n<212223242526222728292a2b2c252d2e222f2a30> Tj\nET\n\nQ\n"
    end
    it "should return hash" do
      @s_nobg.hash.should == {:Length=>200}
    end
    it "should return a  hash " do
      @page_nobg.class.to_s == "Hash"
      #@page_nobg.should == {:Type=>:Page, 
      #                      :Parent=>#<PDF::Reader::Reference:0x922fc28 @id=3, @gen=0>, 
       #                     :MediaBox=>[0, 0, 612.0, 792.0],
       #                     :Contents=>#<PDF::Reader::Reference:0x91fa6a4 @id=4, @gen=0>,
        #                    :Resources=>{:ProcSet=>[:PDF, :Text, :ImageB, :ImageC, :ImageI],
         #                   :Font=>{:"F1.1"=>#<PDF::Reader::Reference:0x918cb90 @id=6, @gen=0>, :"F1.0"=>#<PDF::Reader::Reference:0x918bed4 @id=7, @gen=0>, :"F3.1"=>#<PDF::Reader::Reference:0x9183ae0 @id=8, @gen=0>}}}
    end
    it "should return contents" do
      @page_nobg[:contents].should == ""
    end
  end
  
end
   
