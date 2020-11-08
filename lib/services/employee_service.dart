import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:provider_two_app/models/employee.dart';

class EmployeeService{
  String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>>fetchEmployees() async {
    http.Response response = await http.get(
        Uri.encodeFull(url),
        headers: {'Accept' : 'application/json'}
    );
    var decodedJson = convert.jsonDecode(response.body) as List;
    return decodedJson.map((employee) => Employee.fromJson(employee)).toList();
  }

  Future<Employee>fetchemployee(int id) async {
    final String urlId = "https://jsonplaceholder.typicode.com/users/$id";
    http.Response response = await http.get(
      Uri.encodeFull(urlId),
      headers: {'Accept' : 'application/json'}
    );
    var decodedJson = convert.jsonDecode(response.body);
    return Employee.fromJson(decodedJson);
  }
}