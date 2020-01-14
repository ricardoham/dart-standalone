import 'package:aqueduct/aqueduct.dart';

class ProductsController extends ResourceController {
  List products = [
    {'id': 1, 'name': 'Television'},
    {'id': 2, 'name': 'Table'},
    {'id': 3, 'name': 'PC'},
  ];

  // final List<Products> produc
  @Operation.get()
  Future<Response> getAllProducts() async {
    return Response.ok(products);
  }

  @Operation.get('id')
  Future<Response> getProductById(@Bind.path('id') int id) async {
      // final id = int.parse(request.path.variables['id']); // Deprecated
      final product = products.firstWhere((p) => p['id'] == id, orElse: () => null);
      if(product == null) {
        return Response.notFound();
      }
    return Response.ok(products);
  }

  @Operation.post()
  Future<Response> createProduct(@Bind.body() product) async {
    products.add(product);
    return Response.ok(products);
  }

  @Operation.put()
  Future<Response> changeProduct(@Bind.body() product) async {
    products.removeAt(products.indexWhere((r) => r.id == product.id));
    products.add(product);
    return Response.ok(products);
  }

  @Operation.delete('id')
  Future<Response> deleteProduct() async {
    final id = int.parse(request.path.variables['id']);
    products.removeAt(products.indexWhere((p) => p.id == id));
    return Response.ok(products);
  }

}
