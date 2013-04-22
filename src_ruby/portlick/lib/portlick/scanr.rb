#PortLick::Scanr

require 'socket'

module PortLick
  module Scanr
    def self.scan_host_port(machine, port, mesg, verbose = false)
      begin
        sok = TCPSocket.new(machine.to_s, port.to_i)
        sok.close
        PortLick.log_me "PORT #{port} is OPEN at #{machine} <<< #{mesg}" if verbose
        true
      rescue
        PortLick.log_me "PORT #{port} was Closed at #{machine}" if verbose
        false
      end
    end

    def self.scanner(host_port_msg)
      host_port_msg.each_key do |host|
        host_port_msg[host].each_pair do |port, msg|
          scan_host_port host, port, msg, true
        end
      end
    end
  end
end
