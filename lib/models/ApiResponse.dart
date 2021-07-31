import 'ApiModel.dart';
import 'Info.dart';

class ApiResponse<Model extends ApiModel> {
  final Info info;
  final List<Model> results;

  ApiResponse({required this.info, required this.results});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Model Function(dynamic) mapper) {
    return ApiResponse(
        info: Info.fromJson(json['info']),
        results: (json['results'] as List).map(mapper).toList(),
    );
  }
}
