require_relative 'spec_helper'

describe RbVmomi::VIM do
  before :all do
    @monkey ||= VMonkey.connect
  end

  describe '#get_all_vms' do
    subject { @vms ||= @monkey.get_all_vms }
    its(:length) { should > 0 }
  end

end
