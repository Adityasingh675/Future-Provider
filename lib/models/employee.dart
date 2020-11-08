class Employee{
  final int id;
  final String name;
  final String phone;
  final String email;

  Employee({this.id,this.email,this.name,this.phone});

  Employee.fromJson(Map<String,dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'],
      phone = parsedJson['phone'],
      email = parsedJson['email'];
}