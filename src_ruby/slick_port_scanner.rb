#!/usr/bin/env ruby

require 'socket'  

class SlickPortScanner
  def initialize
    if ARGV[0].nil?
      puts <<no_args
Wrong Syntax, you missed providing required CSV file
Syntax:
        $ ruby slick_port_scanner.rb ../src_java/sample_ports.csv
no_args
      exit 1
    end
    @ports={}
    File.open(ARGV[0],"r"){ |fyl|
      fyl.each_line do |lyn|
        lyn_split = lyn.split(",")
        @ports[lyn_split[1].strip]=[]
        @ports[lyn_split[1].strip].push lyn_split[0].strip
        @ports[lyn_split[1].strip].push lyn_split[2].strip
      end
    }
  end

  def try_open_port(machine, port)
    begin 
      sok = TCPSocket.new(machine, port)
      sok.close
      true
    rescue
      false
    end
  end

  def scanner
    @ports.each_key do |port|
      if try_open_port @ports[port][0], port.to_i
        puts port + " is OPEN at " + @ports[port][0]
      else
        puts port + " was closed at " + @ports[port][0]
      end
    end
  end
end

SlickPortScanner.new.scanner
