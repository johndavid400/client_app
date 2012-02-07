class XronoImport
  def send_client(client)

    # define url for API and credentials
    api_url = ENV['CLIENT_APP_XRONO_URL']
    email = ENV['CLIENT_APP_XRONO_USER']
    password = ENV['CLIENT_APP_XRONO_PASS']

    # create connection information for API call
    conn = Faraday.new(:url => api_url)

    # send login credentials to xrono and parse response for authenticity token
    token_response = conn.post("/api/v1/tokens.json", {"email" => email, "password" => password})
    auth_token = JSON.parse(token_response.body)["token"]

    # send the information in the proper format for Xrono to create a client and contact info along with auth_token
    response = conn.post("/api/v1/clients.json", {"auth_token" => auth_token, "client" => {"name" => client.business_name, "status" => "Inactive"}, "contact" => {"first_name" => client.first_name, "last_name" => client.last_name, "email_address" => client.email, "phone_number" => client.phone_number, "street" => client.business_address, "city" => client.city, "state" => client.state.name, "zip" => client.zip, "receives_email" => client.contact_by_email}})

  end
end
