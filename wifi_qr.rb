require "rqrcode"

# use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:BarevadiaAustin;P:Barevadiagaav65;;")

# use the .as_png method to create a 500px by 500px image
png = qrcode.as_png({:size => 500})

# write the image data to a file
IO.binwrite("sometext.png", png.to_s)
