require 'socket'

def change_mac_address(interface, new_mac)
  # Bring the interface down
  system("ifconfig #{interface} down")

  # Change the MAC address
  system("ifconfig #{interface} hw ether #{new_mac}")

  # Bring the interface up
  system("ifconfig #{interface} up")
end

puts "Enter the network interface (e.g. eth0): "
interface = gets.chomp

puts "Enter the new MAC address (e.g. 00:11:22:33:44:55): "
new_mac = gets.chomp

change_mac_address(interface, new_mac)
