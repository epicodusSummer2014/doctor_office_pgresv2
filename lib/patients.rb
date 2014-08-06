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
    DB.exec("INSERT INTO patients (name, birthday, doctor_id, insurance_id) VALUES ('#{@name}', #{@specialty_id}, #{@insurance_id});")
  end

  def self.all
    Patients = []
    results = DB.exec("SELECT * FROM Patients;")
    results.each do |result|
      specialty_id = result['specialty_id'].to_i
      insurance_id = result['insurance_id'].to_i
      Patients << Patient.new({:id => result['id'], :name => result['name'], :specialty_id => specialty_id, :insurance_id => insurance_id})
    end
    Patients
  end

  def ==(another_Patient)
    self.name == another_Patient.name &&
    self.specialty_id == another_Patient.specialty_id &&
    self.insurance_id == another_Patient.insurance_id
  end
end
