# First we create 10 pages just to have something to link to
require "prawn"
Prawn::Document.generate "outline.pdf" do 
(1..10).each do |index|
text "Page #{index}"
start_new_page
end
outline.define do
section("Section 1", :destination => 1) do
page :title => "Page 2", :destination => 2
page :title => "Page 3", :destination => 3
end
section("Section 2", :destination => 4) do
page :title => "Page 5", :destination => 5
section("Subsection 2.1", :destination => 6, :closed => true) do
page :title => "Page 7", :destination => 7
end
end
end
# Outside of the define block
outline.section "Section 3", :destination => 8 do
outline.page :title => "Page 9", :destination => 9
end
outline.page :title => "Page 10", :destination => 10

end
