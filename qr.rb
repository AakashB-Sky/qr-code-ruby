require "rqrcode"

# ask user for 1-4 input

puts "\nLet's make a QR code! What kind of code would you like to create? (enter 1-4)\n
  1. Open a URL
  2. Join a wifi network
  3. Send a text message\n
  Enter 4 to exit\n\n"

  user_selection = gets.chomp

# check for valid 1-4 input
while user_selection.to_i > 4 or user_selection.to_i == 0
  puts "\n\"#{user_selection}\" is an invalid selection. Please enter a number from 1-4. See QR code options below:\n
    1. Open a URL
    2. Join a wifi network
    3. Send a text message\n
    Enter 4 to exit\n\n"
  user_selection = gets.chomp
end

# save user input as integer
user_selection = user_selection.to_i

# create QR code based on selection

100.times do |counter|
  print "–"
end
print "\n"

if user_selection == 1
  puts "\nLet's make a QR code that links to a URL!\n\n"
  
elsif user_selection == 2
  puts "\nLet's make a QR code that joins a wifi network!\n\n"
elsif user_selection == 3
  puts "\nLet's make a QR code that sends a text message!\n\n"
elsif user_selection ==4
  puts "\nLooks like you don't need a QR code. Come back if you do!\n\n"
end

=begin
gets.chomp

# use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")

# use the .as_png method to create a 500px by 500px image
png = qrcode.as_png({:size => 500})

# write the image data to a file
IO.binwrite("sometext.png", png.to_s)
=end
