json.array!(@drivers) do |driver|
  json.extract! driver, :license_plate_number
  json.url driver_url(driver, format: :json)
end
