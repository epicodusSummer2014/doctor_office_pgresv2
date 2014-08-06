require 'pg'

class Insurance

  attr_accessor :name, :id

  def initialize(insurance_info)
    @name = insurance_info[:name]
    @id = insurance_info[:id]
  end

  def save
    DB.exec("INSERT INTO insurance (insurance) VALUES ('#{@name}');")
  end

  def self.all
    insurance = []
    results = DB.exec("SELECT * FROM insurance;")
    results.each do |result|
      insurance << Insurance.new({:id => result['id'], :name => result['insurance']})
    end
    insurance
  end

  def ==(another_insurance)
    self.name == another_insurance.name
  end
end
