import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loono/models/api_response.dart';
import 'package:loono/models/hospital.dart';

class HospitalsApi {
  HospitalsApi(this._dio, this._baseApiUrl);

  final Dio _dio;
  final String _baseApiUrl;

  Future<ApiResponse<List<Hospital>>> fetchAll() async {
    debugPrint('Fetching hospitals');

    try {
      final response = await _dio.get<List<dynamic>>(_baseApiUrl);
      final hospitals =
          response.data!.map((dynamic json) => Hospital.fromJson(json as Map<String, dynamic>)).toList();

      debugPrint('Fetching hospitals was successfully completed');
      return ApiResponse.success(hospitals);
    } on DioError catch (exception) {
      debugPrint('${exception.message}: ${exception.response.toString()}\n${exception.toString()}');
      return ApiResponse.failure(exception);
    }
  }
}

class ThirdPartyApis {
  ThirdPartyApis(this.dio) {
    hospitalsApi = HospitalsApi(dio, 'https://626113ece7361dff91fed0d7.mockapi.io/api/v1/hospitals');
  }

  final Dio dio;
  late final HospitalsApi hospitalsApi;
}
