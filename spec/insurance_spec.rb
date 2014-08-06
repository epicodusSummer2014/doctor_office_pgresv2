require 'office_spec_helper'

describe 'Insurance' do

  describe 'initialize' do
    it 'creates a new insurance object' do
      new_insurance = Insurance.new({:name => "Blue Cross"})
      expect(new_insurance).to be_a Insurance
    end
  end

  describe '.all' do
    it 'starts off with no insurance' do
      Insurance.all.should eq []
    end
  end

  describe 'save' do
    it 'saves an insurance company to the office database' do
      new_insurance = Insurance.new({:name => "Blue Cross"})
      new_insurance.save
      expect(Insurance.all[0].==(new_insurance)).to eq true
    end
  end

  describe '==' do
    it 'compares two insurance objects' do
      new_insurance = Insurance.new({:name => "Blue Cross"})
      new_insurance2 = Insurance.new({:name => "Blue Cross"})
      expect(new_insurance.==(new_insurance2)).to eq true
    end
  end

end
