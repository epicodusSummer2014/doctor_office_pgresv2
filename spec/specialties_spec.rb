require 'office_spec_helper'

describe 'Specialty' do

  describe 'initialize' do
    it 'creates a new specialties object' do
      new_specialty = Specialty.new({:name => "Pediatrics"})
      expect(new_specialty).to be_a Specialty
    end
  end

  describe '.all' do
    it 'starts off with no specialties' do
      Specialty.all.should eq []
    end
  end

  describe 'save' do
    it 'saves a specialty to the office database' do
      new_specialty = Specialty.new({:name => "Pediatrics"})
      new_specialty.save
      expect(Specialty.all[0].==(new_specialty)).to eq true
    end
  end

  describe '==' do
    it 'compares two specialty objects' do
      new_specialty = Specialty.new({:name => "Internal Medicine"})
      new_specialty2 = Specialty.new({:name => "Internal Medicine"})
      expect(new_specialty.==(new_specialty2)).to eq true
    end
  end

end
