module Employee
    include HTTParty
    base_uri 'https://reqres.in/api/users?page=2'
    format :json
    headers 'Content-Type': 'application/json'
end