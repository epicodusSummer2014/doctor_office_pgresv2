require 'pg'
require 'doctors'
require 'patients'
require 'specialties'
require 'insurance'
require 'rspec'

DB = PG.connect({:dbname => 'office_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialities *;")
    DB.exec("DELETE FROM insurance *;")
  end
end
