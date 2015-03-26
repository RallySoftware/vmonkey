module VMonkey
  module Helpers
    class VM

      def initialize(vim)
        @vim = vim
      end

      def get_all_vms
        vms_in(@vim.dc.vmFolder) 
      end

      def vms_in(entity) # recursively go thru a folder or vapp, dumping vm info
        vms = []
        case entity.class.to_s          
        when "Folder"
          entity.childEntity.each do |c_entity|
            name = c_entity.class.to_s
            case name
            when "Folder"
              vms.concat(vms_in(c_entity))
            when "VirtualMachine"
              vms << vm_info(c_entity)
            when "VirtualApp"
              vms.concat(vms_in(c_entity))
            else
              puts "# Unrecognized Entity " + c_entity.to_s
            end
          end
        when "VirtualApp"
          entity.vm.each { |vapp_vm| vms << vm_info(vapp_vm) }
        end
        return vms
      end

      def vm_info(vm)
        {:name => vm.config.name, :uuid => vm.config.uuid}
      end
    end

  end
end