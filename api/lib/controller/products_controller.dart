import 'package:aqueduct/aqueduct.dart';

class ProductsController extends Controller {
  final _products = [
    {'id': 1, 'name': 'Television'},
    {'id': 2, 'name': 'Table'},
    {'id': 3, 'name': 'PC'},
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    if (request.path.variables.containsKey('id')) {
      final id = int.parse(request.path.variables['id']);
      final product = _products.firstWhere((p) => p['id'] == id, orElse: () => null);
      
      if(product == null) {
        return Response.notFound();
      }
      return Response.ok(product);
    }
    return Response.ok(_products);
  }
}
