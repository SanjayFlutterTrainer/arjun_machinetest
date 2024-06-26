import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machientest/model/productsModel.dart';
import 'package:machientest/model/subCategoryModel.dart';

class ApiService {
  static const String baseUrl = 'https://coinoneglobal.in/crm/';
  static const String apiUrl =
      'https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2';

  Future<List<Products>> fetchTemplateCategories() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.body);
    if (response.statusCode == 200) {
      final data = response.body;
      return productsFromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

   Future<List<SubCategory>> fetchSubCategoryImages(String categoryId) async {
    final String subCategoryUrl =
        'https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=$categoryId';
    final response = await http.get(Uri.parse(subCategoryUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => SubCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load subcategories');
    }
  }
}
