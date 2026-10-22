import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/constants/app_constants.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/data/model/favourite_dto.dart';
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_data_source_interface.dart';

@Injectable(as: FavouriteDataSourceInterface)
class FavouriteDataSourceImp implements FavouriteDataSourceInterface {
  @override
  Future<ResultApi<FavouriteDto>> getFavourites() async {
    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.getFavorite}',
      );
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${AppConstants.token}',
          'Content-Type': 'application/json',
        },
      );
      final json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(FavouriteDto.fromJson(json));
      }
      return Error('Error: ${response.statusCode} ${json["message"] ?? ""}');
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }

  @override
  Future<ResultApi<dynamic>> addToFavourite(int productId) async {
    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.addToFavorite}',
      );
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer ${AppConstants.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );
      final json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(json);
      }
      return Error('Error: ${response.statusCode} ${json["message"] ?? ""}');
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }

  @override
  Future<ResultApi<dynamic>> removeFromFavourite(int productId) async {
    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.removeFavorite}',
      );
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer ${AppConstants.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );
      final json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(json);
      }
      return Error('Error: ${response.statusCode} ${json["message"] ?? ""}');
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }
}
