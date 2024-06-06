class Employee_Requests

    def find_employee
        Employee.get('/employees')
    end
end