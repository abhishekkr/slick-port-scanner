#PortLick::InPut

module PortLick
  module InPut
    def self.csv(csv_file_path)
      host_port_msg = {}
      File.open(csv_file_path, "r"){|fyl|
        fyl.each_line do |lyn|
          host, port, mesg = lyn.split(",").collect{|val| val.strip}
          host_port_msg[host] ||= {}
          host_port_msg[host][port] = mesg
        end
      }
      host_port_msg
    end
  end
end
