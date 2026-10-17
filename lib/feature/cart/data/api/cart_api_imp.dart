import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/constants/app_constants.dart';
import 'package:nti_shopping_app/core/constants/app_keys.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/data/api/cart_api_interface.dart';
import 'package:nti_shopping_app/feature/cart/data/model/cart_dto.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';

@Injectable(as: CartApiInterface)
class CartApiImp implements CartApiInterface {
  CartApiImp()
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {
            "Authorization": "Bearer ${AppKeys.staticToken}",
            "Content-Type": "application/json",
          },
        ),
      );

  final Dio dio;

  @override
  Future<ResultApi<String>> addToCart(String productId) async {
    try {
      final response = await dio.post(
        ApiConstants.addCart,
        data: {'productId': productId},
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        final data = response.data;
        final msg = data['message'];
        return Success(msg);
      } else {
        return Error('Error: ${response.statusCode}');
      }
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }

  @override
  Future<ResultApi<String>> deleteFromCart(String productId) async {
    try {
      final response = await dio.delete(
        ApiConstants.deleteCart,
        data: {'productId': productId},
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        final data = response.data;
        final msg = data['message'];
        return Success(msg);
      } else {
        return Error('Error: ${response.statusCode}');
      }
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }

  @override
  Future<ResultApi<List<CartEntity>>> getCart() async {
    try {
      final response = await dio.get(ApiConstants.getCart);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        final data = response.data;
        final /*List<CartDto>*/ dataList = data['list'];

        return Success([]);
      } else {
        return Error('Error: ${response.statusCode}');
      }
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }
}
