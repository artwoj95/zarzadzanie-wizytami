json.array!(@appointments) do |appointment|
  json.title appointment.purpose
  json.start @merged_date[appointment.id]
  json.url appointment_path(appointment)
  json.textColor 'white'
  json.color appointment.confirmation ? '' : 'red'
end