require 'office_spec_helper'


describe 'Doctor' do
  describe 'initialize' do
    it 'initializes a new doctor' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      expect(new_doctor).to be_a Doctor
    end
  end

  describe '.all' do
    it 'starts off with no tasks' do
      Doctor.all.should eq []
    end
  end

  describe 'save' do
    it 'saves a doctor to the office database' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      expect(Doctor.all[0].==(new_doctor)).to eq true
    end
  end

  describe '==' do
    it 'compares two doctor objects' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor2 = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      expect(new_doctor.==(new_doctor2)).to eq true
    end
  end

  describe '.remove' do
    it 'removes a doctor from the office' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      Doctor.remove(new_doctor.id)
      expect(Doctor.all).to eq []
    end
  end

  describe '.edit_specialty' do
    it 'edits a doctor\'s specialty' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      Doctor.edit_specialty(new_doctor.id, 2)
      expect(Doctor.all[0].specialty_id).to eq 2
    end
  end

  describe '.edit_insurance' do
    it 'edits a doctor\'s insurance' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      Doctor.edit_insurance(new_doctor.id, 1)
      expect(Doctor.all[0].insurance_id).to eq 1
    end
  end

  describe '.specialty_search' do
    it 'lists all doctors with a certain specialty' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      new_doctor2 = Doctor.new({:name => "Dustin", :specialty_id => 1, :insurance_id => 2})
      new_doctor2.save
      expect(Doctor.specialty_search(1)).to eq [new_doctor, new_doctor2]
    end
  end

  describe '.insurance_search' do
    it 'lists all doctors with a certain insurance' do
      new_doctor = Doctor.new({:name => "Mac", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      new_doctor2 = Doctor.new({:name => "Dustin", :specialty_id => 1, :insurance_id => 2})
      new_doctor2.save
      expect(Doctor.insurance_search(2)).to eq [new_doctor, new_doctor2]
    end
  end

  describe '.find_doctor' do
    it 'returns a doctor object based on name searched' do
      new_doctor = Doctor.new({:name => "MAC", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      expect(Doctor.find_doctor('MAC')).to eq [new_doctor]
    end
  end

  describe '.list_patients' do
    it 'returns a list of patients for a specific doctor' do
      new_doctor = Doctor.new({:name => "MAC", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      new_patient = Patient.new({:name => "Dustin", :doctor_id => new_doctor.id, :insurance_id => 2, :birthday => '1675-01-02'})
      new_patient.save
      new_patient2 = Patient.new({:name => "Scott", :doctor_id => new_doctor.id, :insurance_id => 2, :birthday => '1952-03-04'})
      new_patient2.save
      expect(Doctor.list_patients(new_doctor.id)).to eq [new_patient, new_patient2]
    end
  end

  #
  describe 'count' do
    it 'returns the number of patients with a specific doctor_id' do
    new_doctor = Doctor.new({:name => "MAC", :specialty_id => 1, :insurance_id => 2})
      new_doctor.save
      new_patient = Patient.new({:name => "Dustin", :doctor_id => new_doctor.id, :insurance_id => 2, :birthday => '1675-01-02'})
      new_patient.save
      new_patient2 = Patient.new({:name => "Scott", :doctor_id => new_doctor.id, :insurance_id => 2, :birthday => '1952-03-04'})
      new_patient2.save
      expect(new_doctor.count).to eq 2
    end
  end
end
