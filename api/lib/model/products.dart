import 'package:aqueduct/aqueduct.dart';

class Products extends Serializable {
  int id;
  String name;

  @override
  Map<String, dynamic> asMap() {
    return {"id": id, "name": name};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object["id"] as int;
    name = object["name"] as String;
  }
}
