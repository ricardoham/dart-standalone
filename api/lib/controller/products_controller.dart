import 'package:aqueduct/aqueduct.dart';

class ProductsController extends Controller {
  final _products = [
    {'id': 1, 'name': 'Television'},
    {'id': 2, 'name': 'Table'},
    {'id': 3, 'name': 'PC'},
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_products);
  }
}
