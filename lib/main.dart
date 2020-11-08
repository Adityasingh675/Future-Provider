import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_two_app/screens/home.dart';
import 'package:provider_two_app/services/employee_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final EmployeeService employeeService = EmployeeService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (BuildContext context) => employeeService.fetchEmployees(),
      catchError: (BuildContext context, error) {
        print(error.toString());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Home(),
      ),
    );
  }
}
