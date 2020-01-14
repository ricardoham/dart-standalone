import 'package:api/api.dart';
import 'package:api/model/products.dart';
import 'package:aqueduct/aqueduct.dart';

class ProductsController extends ResourceController {

  ProductsController() {
    acceptedContentTypes = [ContentType.json];
  }
  final List<Products> products = [
    Products()..id = 1 ..name = 'Television',
    Products()..id = 2 ..name = 'Table',
    Products()..id = 3 ..name = 'PC',
  ];

  // final List<Products> produc
  @Operation.get()
  Future<Response> getAllProducts() async {
    return Response.ok(products);
  }

  @Operation.get('id')
  Future<Response> getProductById(@Bind.path('id') int id) async {
      final id = int.parse(request.path.variables['id']);
      final product = products.firstWhere((p) => p.id == id, orElse: () => null);
      if(product == null) {
        return Response.notFound();
      }
    return Response.ok(products);
  }

  @Operation.post()
  Future<Response> createProduct(@Bind.body() Products product) async {
    products.add(product);
    return Response.ok(products);
  }

  @Operation.put()
  Future<Response> changeProduct(@Bind.body() Products product) async {
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
