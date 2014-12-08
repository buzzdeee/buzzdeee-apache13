require 'spec_helper'
describe 'apache13' do

  context 'with defaults for all parameters' do
    it { should contain_class('apache13') }
  end
end
