module DNSUpdate
  def self.current_ip
    Net::HTTP.get(URI.parse('http://whatismyip.akamai.com'))
  end

  def self.get_ip_from_hostname(hostname)
    Socket::getaddrinfo(hostname, '', nil, Socket::SOCK_STREAM)[0][3]
  end
end
