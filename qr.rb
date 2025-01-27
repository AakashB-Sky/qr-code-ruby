require "rqrcode"

puts "\nLet's make a QR code! What kind of code would you like to create? (enter 1-4)\n
  1. Open a URL
  2. Join a wifi network
  3. Send a text message\n
  Enter 4 to exit\n\n"

user_selection = gets.chomp

while user_selection.to_i > 4 or user_selection.to_i.class.to_s != "Integer"
  puts "\n\"#{user_selection}\" is an invalid selection. Please enter a number from 1-4. See QR code options below:\n
    1. Open a URL
    2. Join a wifi network
    3. Send a text message\n
    Enter 4 to exit\n\n"
  user_selection = gets.chomp
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
