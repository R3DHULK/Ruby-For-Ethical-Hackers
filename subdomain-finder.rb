require 'resolv'

# Prompt user for target domain
print "Enter target domain: "
target = gets.chomp

# Create a new instance of the Resolver object
resolver = Resolv::DNS.new

# Find all subdomains
subdomains = []
resolver.each_resource(target, Resolv::DNS::Resource::IN::NS) do |resource|
    subdomains << resource.name.to_s
end

# Print the subdomains
if subdomains.any?
    puts "Subdomains found:"
    puts subdomains
else
    puts "No subdomains found."
end
