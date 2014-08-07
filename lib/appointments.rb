class Appointment

  attr_accessor :doctor, :patient, :date, :cost, :id

  def initialize(appointment_info)
    @doctor = appointment_info[:doctor]
    @patient = appointment_info[:patient]
    @date = appointment_info[:date]
    @cost = appointment_info[:cost]
  end

  def save
    results = DB.exec("INSERT INTO appointments (doctor, patient, date, cost) VALUES ('#{@doctor}', '#{@patient}', '#{@date}', #{@cost}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    appointments = []
    results = DB.exec("SELECT * FROM appointments;")
    results.each do |result|
      appointments << Appointment.new({:doctor => result['doctor'], :patient => result['patient'], :date => result['date'], :cost => result['cost'].to_i})
    end
  appointments
  end

  def ==(another_appointment)
    self.doctor == another_appointment.doctor && self.patient == another_appointment.patient && self.date == another_appointment.date && self.cost == another_appointment.cost
  end
end

