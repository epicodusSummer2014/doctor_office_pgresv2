require 'pg'

class Specialty

  attr_accessor :name, :id

  def initialize(specialty_info)
    @name = specialty_info[:name]
    @id = specialty_info[:id]
  end

  def save
    DB.exec("INSERT INTO specialities (specialty) VALUES ('#{@name}');")
  end

  def self.all
    specialties = []
    results = DB.exec("SELECT * FROM specialities;")
    results.each do |result|
      specialties << Specialty.new({:id => result['id'], :name => result['specialty']})
    end
    specialties
  end

  def ==(another_specialty)
    self.name == another_specialty.name
  end
end
