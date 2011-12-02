require 'rubygems'
require 'sinatra'
#setting
set :root, File.dirname(__FILE__)
set :public_folder, File.dirname(__FILE__) + '/stylesheets'
set :port, 4993
#require 'config/setting.rb'

#template :layout do
 # "%html\n =yield\n"
#end
require 'rubygems'
require 'pdf/reader'
  
  #@filename = File.expand_path(File.dirname(__FILE__)) + "/../stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
 # @filename = File.expand_path(File.dirname(__FILE__)) + "/views/books/O'Reilly.HTML5.Up.and.Running.pdf"
  
get '/' do
  haml :index
end

get '/hanzi' do
  haml :'hanzi/index'
end

get '/hanzi/zwxmhz' do
  haml :'hanzi/zwxmhz'
end

get '/hanzi/wxwmhz' do
  haml :'hanzi/wxwmhz'
end

get '/books' do
 
  @filename = File.expand_path(File.dirname(__FILE__)) + "/../stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  @filename = "/home/ney/todos/stylesheets/O'Reilly.HTML5.Up.and.Running.pdf"
  PDF::Reader.open(@filename) do |reader|
    @info = reader.info
    @metadata = reader.metadata
    #reader.pages.each do |page| 
    #  @text = page.text
    #end
    #@page_count = reader.page_count
  end
  haml :'books/index'
end

__END__

@@ layout
!!!
%html
  %head
    %title My Todos
    
    %link{:href => "stylesheets/screen.css", :media => "screen,projection", :rel => "stylesheet", :type => "text/css" }
    %link{:href => "stylesheets/print.css", :media => "print", :rel => "stylesheet", :type => "text/css"}
    
    %link{:href => "stylesheets/app.css", :rel => "stylesheet" }
    
    %nav.nav_head
      %ul
        %li
          %a{:href => "/"} 首页
        %li
          %a{:href => "/hanzi"}汉字研究
        %li
          其它
          
      
    
  %body
    %page
      %header
        %h1
          Hello world!
        %p 
          我用这个网站记录下我学习的过程，我的学习涉及到了宇宙学，佛学，语言学，基因学，社会文明学，数学，以及网络技术等。
   
      %article
        = yield
      %footer
      

