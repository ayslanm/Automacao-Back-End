Dado('que o usuario consulte informacoes de funcionario') do
@get_url = 'https://reqres.in/api/users?page=2'
end
  
Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
end
  
Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end

Dado('que o usuario cadastre um novo funcionario') do
    @post_url = 'https://reqres.in/api/users'
end
  
Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
        "id": 27,
        "employee_name": "Tony",
        "employee_salary": 420800,
        "employee_age": 30,
        "profile_image": ""
}.to_json)

    puts @create_employee
end
  
Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql (201)
    expect(@create_employee.msg).to eql 'Created'
    expect(@create_employee["employee_name"]).to eql 'Tony'
    expect(@create_employee["employee_salary"]).to eql (420800)
    expect(@create_employee["employee_age"]).to eql (30)
end