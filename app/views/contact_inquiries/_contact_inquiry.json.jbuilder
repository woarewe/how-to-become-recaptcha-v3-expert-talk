json.extract! contact_inquiry, :id, :name, :email, :description, :created_at, :updated_at
json.url contact_inquiry_url(contact_inquiry, format: :json)
