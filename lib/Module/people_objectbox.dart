import 'package:objectbox/objectbox.dart';

@Entity()
class People {
  int id;
  String firstName;
  String lastName;
  int age;

  People(
      {this.id = 0,
      required this.firstName,
      required this.lastName,
      required this.age});
}
