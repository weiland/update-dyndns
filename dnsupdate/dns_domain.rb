module DNSUpdate
  class DNSDomain

    def initialize(hostname, username, password, provider)
      @hostname = hostname
      @username = username
      @password = password
      @provider = provider
    end

    def get_update_url
      URI.parse('https://' + @provider + '/api/?hostname=' + @hostname + '&myip=' + current_ip)
    end

    def get_username
      @username
    end

    def get_password
      @password
    end

    def get_ip
      DNSUpdate::get_ip_from_hostname(@hostname)
    end

    def current_ip
      DNSUpdate::current_ip
    end
  end
end
