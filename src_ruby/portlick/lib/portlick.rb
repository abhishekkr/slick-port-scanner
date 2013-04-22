#!/usr/bin/env ruby

require 'arg0'
portlick_all = File.join(File.dirname(File.expand_path __FILE__), '*', '*.rb')
Dir.glob(portlick_all).each {|lib| require lib}

module PortLick
  class << self
    attr_accessor :verbose, :log
  end

  def self.portscanner
    PortLick.verbose = Arg0::Console.switch?(['-v', '--verbose'])

    Arg0::Console.value_for(['-csv', '--csv-file']).each do |csvfile|
      host_port_msg = PortLick::InPut.csv csvfile
      p host_port_msg
      PortLick::Scanr.scanner host_port_msg
    end
  end

  def self.log_me(msg)
    puts "[+] #{Time.now.strftime("%D-%T")} |  #{msg}" if @verbose
  end
end
