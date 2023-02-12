require 'resolv'

def dns_enum(domain)
  resolver = Resolv::DNS.new

  begin
    # Enumerate nameservers
    nameservers = resolver.getresources(domain, Resolv::DNS::Resource::IN::NS)
    puts "Nameservers for #{domain}:"
    nameservers.each do |ns|
      puts "  #{ns.name}"
    end

    # Enumerate MX records
    mx_records = resolver.getresources(domain, Resolv::DNS::Resource::IN::MX)
    puts "MX records for #{domain}:"
    mx_records.each do |mx|
      puts "  #{mx.exchange} (priority #{mx.preference})"
    end

    # Enumerate A records
    a_records = resolver.getresources(domain, Resolv::DNS::Resource::IN::A)
    puts "A records for #{domain}:"
    a_records.each do |a|
      puts "  #{a.address}"
    end

    # Enumerate CNAME records
    cname_records = resolver.getresources(domain, Resolv::DNS::Resource::IN::CNAME)
    puts "CNAME records for #{domain}:"
    cname_records.each do |cname|
      puts "  #{cname.name}"
    end

  rescue Resolv::ResolvError => e
    puts "Error resolving DNS records for #{domain}: #{e}"
  end
end

puts "Enter the domain to enumerate:"
domain = gets.chomp

dns_enum(domain)
