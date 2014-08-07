require 'office_spec_helper'

describe 'Appointment' do
  describe 'initialize' do
    it 'initializes a new appointment' do
      new_appt = Appointment.new({:doctor => 'Guy', :patient => 'Mac', :date => '2022-09-23', :cost => 99999999})
      expect(new_appt).to be_a Appointment
    end
  end

  describe 'save' do
    it 'saves an appointment to the database' do
      new_appt = Appointment.new({:doctor => 'Guy', :patient => 'Mac', :date => '2022-09-23', :cost => 99999999})
      new_appt.save
      expect(Appointment.all).to eq [new_appt]
    end
  end

  describe '.all' do
    it 'lists all appointments in the database in an array' do
      new_appt = Appointment.new({:doctor => 'Guy', :patient => 'Mac', :date => '2022-09-23', :cost => 99999999})
      new_appt.save
      new_appt2 = Appointment.new({:doctor => 'Austin', :patient => 'Dustin', :date => '2022-08-23', :cost => 89999999})
      new_appt2.save
      expect(Appointment.all).to eq [new_appt, new_appt2]
    end
  end

  describe '==' do
    it 'compares two appointments' do
      new_appt = Appointment.new({:doctor => 'Guy', :patient => 'Mac', :date => '2022-09-23', :cost => 99999999})
      new_appt2 = Appointment.new({:doctor => 'Guy', :patient => 'Mac', :date => '2022-09-23', :cost => 99999999})
      expect(new_appt.==(new_appt2)).to eq true
    end
  end
end
