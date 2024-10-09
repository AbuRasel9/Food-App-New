import 'package:foodly_ui/lib/core/dataModel/product/popular_product_response.dart';
import 'package:foodly_ui/lib/utils/api_consts.dart';

import '../../network/api_client.dart';
import '../../service/service_locator.dart';

part 'product_repo_impl.dart';

abstract class ProductRepo{
  final authService =di.get<ApiClient>();

  Future<PopularProductResponse>popularProduct();

}