#!/usr/bin/env ruby

require File.expand_path (File.join File.dirname(__FILE__), "scanr.rb")
require File.expand_path (File.join File.dirname(__FILE__), "inPut.rb")

class SlickPortScanner
  def initialize
    if ARGV[0].nil?
      puts <<no_args
Wrong Syntax, you missed providing required CSV file
Syntax:
        $ ruby h4cker_s_can.rb sample_input/args.csv
no_args
      exit 1
    end
    @csv_file_path = ARGV[0]
  end

  def portscanner
    host_port_msg = InPut.new(@csv_file_path).get_host_port_msg
    Scanr.new(host_port_msg).scanner
  end
end

SlickPortScanner.new.portscanner
