require 'office_spec_helper'

describe 'Patient' do
  describe 'initialize' do
    it 'initializes a new patient' do
      new_patient = Patient.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      expect(new_patient).to be_a Patient
    end
  end

  describe '.all' do
    it 'starts off with no tasks' do
      Patient.all.should eq []
    end
  end

  describe 'save' do
    it 'saves a patient to the office database' do
      new_patient = Patient.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_patient.save
      expect(Patient.all[0].==(new_patient)).to eq true
    end
  end

  describe '==' do
    it 'compares two patient objects' do
      new_patient = Patient.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_patient2 = Patient.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      expect(new_patient.==(new_patient2)).to eq true
    end
  end
end
