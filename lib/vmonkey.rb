require 'rbvmomi'
require_relative 'vmonkey/version'
require_relative 'vmonkey/vim/vim'
require_relative 'vmonkey/helpers/vm_helper'

monkey_vim = File.join(File.dirname(__FILE__), 'vmonkey', 'vim')
RbVmomi::VIM.add_extension_dir monkey_vim

module VMonkey
  def self.connect(opts = nil)
    RbVmomi::VIM.monkey_connect(opts)
  end

  def self.default_opts
    RbVmomi::VIM.default_opts
  end
end

module VMonkey
  def self.string_parent(s)
    p = s.split('/')[0...-1].join('/')
    p == '' ? '/' : p
  end

  def self.string_basename(s)
    p = s.split('/').last
  end

  if '1' == RUBY_VERSION.split('.')[0]
    class ::String
      def parent
        VMonkey::string_parent(self)
      end

      def basename
        VMonkey::string_basename(self)
      end
    end
  else
    refine String do
      def parent
        VMonkey::string_parent(self)
      end

      def basename
        VMonkey::string_basename(self)
      end
    end
  end
end

class RbVmomi::BasicTypes::ManagedObject
  def monkey
    _connection
  end
end