import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:typed_data';
import 'package:authsec_flutter/resources/api_constants.dart';
import 'dart:convert';
import 'dart:typed_data';
class ApiService {
  final String baseUrl = ApiConstants.baseUrl;
  final Dio dio = Dio();


   Future<List<Map<String, dynamic>>> getEntities(String token) async {

    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('$baseUrl/Gtesr/Gtesr');
      final entities = (response.data as List).cast<Map<String, dynamic>>();
      return entities;
    } catch (e) {
      throw Exception('Failed to get all entities: $e');
    }
  }

 Future<void> createEntity(String token, Map<String, dynamic> entity) async {
    try {
      print("in post api" + entity.toString());
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.post('$baseUrl/Gtesr/Gtesr', data: entity);
      print(entity);
    } catch (e) {
      throw Exception('Failed to create entity: $e');
    }
  }

  Future<void> updateEntity(String token, int entityId, Map<String, dynamic> entity) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.put('$baseUrl/Gtesr/Gtesr/$entityId',
          data: entity);                print(entity);

    } catch (e) {
      throw Exception('Failed to update entity: $e');
    }
  }

  Future<void> deleteEntity(String token, int entityId) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.delete('$baseUrl/Gtesr/Gtesr/$entityId');
    } catch (e) {
      throw Exception('Failed to delete entity: $e');
    }
  }
}