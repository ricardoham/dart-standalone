import 'package:aqueduct/aqueduct.dart';

class ProductsController extends ResourceController {
  final _products = [
    {'id': 1, 'name': 'Television'},
    {'id': 2, 'name': 'Table'},
    {'id': 3, 'name': 'PC'},
  ];

  @Operation.get()
  Future<Response> getAllProducts() async {
    return Response.ok(_products);
  }

  @Operation.get('id')
  Future<Response> getProductById(@Bind.path('id') int id) async {
      // final id = int.parse(request.path.variables['id']); // Deprecated
      final product = _products.firstWhere((p) => p['id'] == id, orElse: () => null);
      if(product == null) {
        return Response.notFound();
      }
    return Response.ok(_products);
  }
}
