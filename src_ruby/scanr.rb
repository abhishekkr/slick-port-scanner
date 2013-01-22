#!/usr/bin/env ruby

require 'socket'

class Scanr
  def initialize(host_port_msg)
    @csvdata=host_port_msg
  end

  def scan_host_port(machine, port, verbose = false)
    begin
      sok = TCPSocket.new(machine.to_s, port.to_i)
      sok.close
      log "PORT #{port} is OPEN at #{machine} <<< #{@csvdata[machine][port]}" if verbose
      true
    rescue
      log "PORT #{port} was Closed at #{machine}" if verbose
      false
    end
  end

  def scanner
    @csvdata.each_key do |host|
      @csvdata[host].each_key do |port|
        scan_host_port host, port, true
      end
    end
  end

  def log(msg)
    puts "[+] #{Time.now.strftime("%D-%T")} |  #{msg}"
  end
end
