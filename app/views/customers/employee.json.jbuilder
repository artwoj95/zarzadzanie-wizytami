json.array!(@appointments) do |appointment|
  json.title "Busy term"
  json.start @merged_date[appointment.id]
end