module DNSUpdate
  class DNSUpdater
    def initialize(*args)
      dns_domain = DNSDomain.new(*args) # TODO: put in here given params

      if dns_domain.get_ip != DNSUpdate::current_ip
        puts 'needs to update the ip'
        update_dns(dns_domain)
      else
        puts 'the ip is already up to date'
      end
    end

    private
    def update_dns(dns_domain)
      uri = dns_domain.get_update_url
      Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https',
        :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

        request = Net::HTTP::Get.new uri.request_uri
        request.basic_auth(dns_domain.get_username, dns_domain.get_password)

        response = http.request(request)

        puts response.body
      end
    end

  end
end
