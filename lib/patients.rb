require 'pg'

class Patient

  attr_accessor :name, :doctor_id, :insurance_id, :id, :birthday

  def initialize(patient_info)
    @name = patient_info[:name]
    @doctor_id = patient_info[:doctor_id]
    @insurance_id = patient_info[:insurance_id]
    @birthday = patient_info[:birthday]
    @id = patient_info[:id]
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday, doctor_id, insurance_id) VALUES ('#{@name}', '#{@birthday}', #{@doctor_id}, #{@insurance_id});")
  end

  def self.all

    patients = []
    results = DB.exec("SELECT * FROM patients;")
    results.each do |result|
      doctor_id = result['doctor_id'].to_i
      insurance_id = result['insurance_id'].to_i
      patients << Patient.new({:id => result['id'], :name => result['name'], :doctor_id => doctor_id, :insurance_id => insurance_id, :birthday => result['birthday']})
    end
    patients
  end

  def ==(another_patient)
    self.name == another_patient.name &&
    self.doctor_id == another_patient.doctor_id &&
    self.insurance_id == another_patient.insurance_id &&
    self.birthday == another_patient.birthday
  end
end
