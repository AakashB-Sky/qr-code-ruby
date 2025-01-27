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
  print "Please provide a URL for the QR code: "
  input_url = gets.chomp
  puts "Creating QR code to \"#{input_url}\"..."
  qrcode = RQRCode::QRCode.new("#{input_url}")

elsif user_selection == 2
  puts "\nLet's make a QR code that joins a wifi network!\n\n"
  print "Please provide the name of the wifi network: "
  wifi_name = gets.chomp
  print "Enter the password for the wifi network: "
  wifi_password = gets.chomp
  puts "Creating QR code to join \"#{wifi_name}\"..."
  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi_name};P:#{wifi_password};;")

elsif user_selection == 3
  puts "\nLet's make a QR code that sends a text message!\n\n"
  print "Please provide the phone number you'd like to text (exclude parentheses and dashes): "
  input_phone_num = gets.chomp
  puts "What message would you like to send to #{input_phone_num}?"
  text_message = gets.chomp
  puts "Creating QR code to text #{input_phone_num}..."
  qrcode = RQRCode::QRCode.new("SMSTO:#{input_phone_num}:#{text_message}")
elsif user_selection ==4
  puts "\nLooks like you don't need a QR code. Come back if you do!\n\n"
end

# use the .as_png method to create a 500px by 500px image
png = qrcode.as_png({:size => 500})

# ask user for file name
print "Provide a name for your image file (exclude file extension): "
file_name_input = gets.chomp

# write the image data to a file
IO.binwrite("#{file_name_input}.png", png.to_s)

puts "Check your folder for your QR code!"
