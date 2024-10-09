part of 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  @override
  Future<PopularProductResponse> popularProduct() async {
    try {
      final result =
          await authService.get(apiEndPoint: AppApiConstants.popularProduct);
      if (result.statusCode == 200) {
        return PopularProductResponse.fromJson(result.data);
      } else {
        throw Exception(
            "data parse error or status code  error--${result.statusCode}",);
      }
    } catch (e) {
      throw Exception("Api call error--$e");
    }
  }
}
