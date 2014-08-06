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
end
