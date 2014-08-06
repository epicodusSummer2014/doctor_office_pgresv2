require 'office_spec_helper'

describe 'Patient' do
  describe 'initialize' do
    it 'initializes a new patient' do
      new_patient = Patient.new({:name => "Dustin", :doctor_id => 1, :insurance_id => 2, :birthday => '1675-01-02'})
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
      new_patient = Patient.new({:name => "Dustin", :doctor_id => 1, :insurance_id => 2, :birthday => '1675-01-02'})
      new_patient.save
      expect(Patient.all[0].==(new_patient)).to eq true
    end
  end

  describe '==' do
    it 'compares two patient objects' do
      new_patient = Patient.new({:name => "Dustin", :doctor_id => 1, :insurance_id => 2, :birthday => '1675-01-02'})
      new_patient2 = Patient.new({:name => "Dustin", :doctor_id => 1, :insurance_id => 2, :birthday => '1675-01-02'})
      expect(new_patient.==(new_patient2)).to eq true
    end
  end

  describe '.edit_doctor_id' do
    it 'edits a patient\'s chosen doctor (doctor_id)' do
      new_patient = Patient.new({:name => "Dustin", :doctor_id => 1, :insurance_id => 2, :birthday => '1675-01-02'})
      new_patient.save
      Patient.edit_doctor_id(new_patient.id, 2)
      expect(Patient.all[0].doctor_id).to eq 2
    end
  end

  describe '.edit_insurance' do
    it 'edits a patient\'s insurance' do
      new_patient = Patient.new({:name => "Dustin", :doctor_id => 1, :insurance_id => 2, :birthday => '1675-01-02'})
      new_patient.save
      Patient.edit_insurance(new_patient.id, 1)
      expect(Patient.all[0].insurance_id).to eq 1
    end
  end
end
