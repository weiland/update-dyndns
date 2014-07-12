#!/usr/bin/env ruby
require 'net/http'
require 'openssl'

require_relative 'dnsupdate/helper'
require_relative 'dnsupdate/dns_domain'
require_relative 'dnsupdate/dns_updater'

DNSUpdate::DNSUpdater.new('hostname.com', 'user@name.com', 'lovelyPassword' ,'www.dnsdynamic.org')
