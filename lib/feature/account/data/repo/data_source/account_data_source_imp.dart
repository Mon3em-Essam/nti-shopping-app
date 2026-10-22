import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/feature/account/data/model/account_dto.dart';

import 'account_data_source_interface.dart';

@Injectable(as: AccountDataSourceInterface)
class AccountDataSourceImp implements AccountDataSourceInterface {
  @override
  Future<AccountDto> getAccountData() async {
    final url = Uri.parse('${ApiConstants.baseUrl}/portfoilo/userData');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      return AccountDto.fromJson(Map<String, dynamic>.from(json));
    } else {
      throw Exception('Failed to load account data');
    }
  }

  @override
  Future<void> updateAccountData({
    required String name,
    required String email,
    required String phone,
    File? image,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/portfoilo/editUserData');
    final request = http.MultipartRequest('POST', url);

    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;

    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath('image', image.path),
      );
    }

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to update profile');
    }
  }
}