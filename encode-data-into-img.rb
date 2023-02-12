require 'chunky_png'

def hide_message(input_image, output_image, message)
  # Open the input image
  image = ChunkyPNG::Image.from_file(input_image)

  # Convert the message to binary
  binary_message = message.unpack("B*").first

  # Check if the message is too long to fit in the image
  raise "Message too long to fit in the image" if binary_message.length > image.pixels.length * 3

  # Iterate through each pixel and hide the message in the least significant bits
  image.pixels.each_with_index do |pixel, index|
    next if binary_message.empty?

    # Get the next 8 bits from the message
    next_bits = binary_message[0...8]
    binary_message = binary_message[8..-1]

    # Hide the bits in the least significant bits of the red, green, and blue values
    red = (pixel >> 16) & 0xff
    green = (pixel >> 8) & 0xff
    blue = pixel & 0xff

    red = (red & 0xfc) | next_bits[0...2].to_i(2)
    green = (green & 0xfc) | next_bits[2...4].to_i(2)
    blue = (blue & 0xfc) | next_bits[4...6].to_i(2)

    # Update the pixel with the hidden message
    image[index % image.width, index / image.width] = ChunkyPNG::Color.rgb(red, green, blue)
  end

  # Save the output image
  image.save(output_image)
end

# Usage: ruby steganography.rb input.png output.png "secret message"
input_image, output_image, message = ARGV
hide_message(input_image, output_image, message)
