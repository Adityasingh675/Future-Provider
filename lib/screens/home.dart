import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_two_app/models/employee.dart';
import 'package:provider_two_app/screens/employee.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Employee> employees = Provider.of<List<Employee>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider'),
      ),
      body: (employees == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  subtitle: Text(employees[index].email),
                  title: Text(employees[index].name),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EmployeePage(
                            id: employees[index].id,
                            name: employees[index].name)));
                  },
                );
              },
            ),
    );
  }
}
