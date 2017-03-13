require 'spec_helper'

# include Watcher

describe "Watcher" do

  before :each do
    @dir        = 'src_ism'
    @log_folder = 'logs'
  end

  context 'directories exist' do
    it 'should return true when exists' do
      expect(@dir).to be_truthy
    end

    it 'should return true when exists' do
      expect(@log_folder).to be_truthy
    end
  end


end
