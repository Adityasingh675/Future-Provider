import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_two_app/models/employee.dart';
import 'package:provider_two_app/services/employee_service.dart';

class EmployeePage extends StatelessWidget {
  final int id;
  final String name;
  final EmployeeService employeeService = EmployeeService();

  EmployeePage({@required this.id, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureProvider(
        create: (BuildContext context) => employeeService.fetchemployee(id),
        child: Center(
          child: Consumer<Employee>(
            builder: (context, employee, widget) {
              return (employee !=null)
                  ? Text('Employee Phone: ${employee.phone}')
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
