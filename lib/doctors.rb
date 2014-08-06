require 'pg'

class Doctor

  attr_accessor :name, :specialty_id, :insurance_id, :id

  def initialize(doctor_info)
    @name = doctor_info[:name]
    @specialty_id = doctor_info[:specialty_id]
    @insurance_id = doctor_info[:insurance_id]
    @id = doctor_info[:id]
  end

  def save
    results = DB.exec("INSERT INTO doctors (name, specialty_id, insurance_id) VALUES ('#{@name}', #{@specialty_id}, #{@insurance_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      specialty_id = result['specialty_id'].to_i
      insurance_id = result['insurance_id'].to_i
      doctors << Doctor.new({:id => result['id'], :name => result['name'], :specialty_id => specialty_id, :insurance_id => insurance_id})
    end
    doctors
  end

  def ==(another_doctor)
    self.name == another_doctor.name &&
    self.specialty_id == another_doctor.specialty_id &&
    self.insurance_id == another_doctor.insurance_id
  end

  def self.remove(doctor_id)
    DB.exec("DELETE FROM doctors WHERE id = #{doctor_id};")
  end

  def self.edit_specialty(doctor_id, new_specialty_id)
    DB.exec("UPDATE doctors SET specialty_id = #{new_specialty_id} WHERE id = #{doctor_id};")
  end

  def self.edit_insurance(doctor_id, new_insurance_id)
    DB.exec("UPDATE doctors SET insurance_id = #{new_insurance_id} WHERE id = #{doctor_id};")
  end

  def self.specialty_search(specialty)
    doctors = []
    results = DB.exec("SELECT * FROM doctors WHERE specialty_id = #{specialty};")
    results.each do |result|
      specialty_id = result['specialty_id'].to_i
      insurance_id = result['insurance_id'].to_i
      doctors << Doctor.new({:id => result['id'], :name => result['name'], :specialty_id => specialty_id, :insurance_id => insurance_id})
    end
    doctors
  end

  def self.insurance_search(insurance)
    doctors = []
    results = DB.exec("SELECT * FROM doctors WHERE insurance_id = #{insurance};")
    results.each do |result|
      specialty_id = result['specialty_id'].to_i
      insurance_id = result['insurance_id'].to_i
      doctors << Doctor.new({:id => result['id'], :name => result['name'], :specialty_id => specialty_id, :insurance_id => insurance_id})
    end
    doctors
  end

  def self.find_doctor(name)
    doctor = []
    results = DB.exec("SELECT * FROM doctors WHERE name = '#{name}';")
    results.each do |result|
      specialty_id = result['specialty_id'].to_i
      insurance_id = result['insurance_id'].to_i
      doctor << Doctor.new({:id => result['id'], :name => result['name'], :specialty_id => specialty_id, :insurance_id => insurance_id})
    end
    doctor
  end

  def self.list_patients(doctor_id)
    patients = []
    results = DB.exec("SELECT * FROM patients WHERE doctor_id = #{doctor_id}")
    results.each do |result|
      doctor_id = result['doctor_id'].to_i
      insurance_id = result['insurance_id'].to_i
      patients << Patient.new({:id => result['id'], :name => result['name'], :doctor_id => doctor_id, :insurance_id => insurance_id, :birthday => result['birthday']})
    end
    patients
  end

  def count
    results = DB.exec("SELECT count(*) FROM patients WHERE doctor_id = #{self.id};").first
    results['count'].to_i
  end
end
