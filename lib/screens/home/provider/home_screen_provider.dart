import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shop_app/screens/home/models/products_by_category_model.dart';
import 'package:shop_app/utils/api_support.dart';
import 'package:shop_app/screens/home/models/category_model.dart';
import 'package:shop_app/screens/home/models/products_model.dart';

class HomeProvider with ChangeNotifier {
  bool getAllCategoriesLoading = false;

  List<GetAllCategories> allCategories = [];

  Future<GetAllCategories?> getAllCategories(context) async {
    getAllCategoriesLoading = true;
    var url = Uri.parse(ApiSupport.baseUrl + ApiSupport.categories);
    var headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('${ApiSupport.consumerKey}:${ApiSupport.consumerSecret}'))}',
    };

    Response response = await http.get(url, headers: headers);

    log(url.toString());
    log(response.body);
    if (response.statusCode == 200) {
      allCategories = getAllCategoriesFromJson(response.body);
      getAllCategoriesLoading = false;

      notifyListeners();
    } else {
      getAllCategoriesLoading = false;
      log('Request failed with status: ${response.statusCode}.');
      notifyListeners();
    }

    notifyListeners();

    return null;
  }

  bool getAllProductsLoading = false;

  List<GetAllProducts> allProducts = [];

  Future<GetAllProducts?> getAllProducts(context) async {
    getAllProductsLoading = true;
    var url = Uri.parse(ApiSupport.baseUrl + ApiSupport.products);
    var headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('${ApiSupport.consumerKey}:${ApiSupport.consumerSecret}'))}',
    };

    Response response = await http.get(url, headers: headers);

    log(url.toString());
    log(response.body);
    if (response.statusCode == 200) {
      allProducts = getAllProductsFromJson(response.body);
      getAllProductsLoading = false;

      notifyListeners();
    } else {
      getAllProductsLoading = false;
      log('Request failed with status: ${response.statusCode}.');
      notifyListeners();
    }

    notifyListeners();

    return null;
  }

  bool getAllProductsByCategoryLoading = false;

  List<GetAllProductsByCategory> allProductsByCategory = [];

  Future<GetAllProducts?> getAllProductsByCategory(int categoryId) async {
    getAllProductsByCategoryLoading = true;
    var url = Uri.parse(
        ApiSupport.baseUrl + ApiSupport.productsByCategory(categoryId: categoryId));
    var headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('${ApiSupport.consumerKey}:${ApiSupport.consumerSecret}'))}',
    };

    Response response = await http.get(url, headers: headers);

    log(url.toString());
    log(response.body);
    if (response.statusCode == 200) {
      allProductsByCategory = getAllProductsByCategoryFromJson(response.body);
      getAllProductsByCategoryLoading = false;

      notifyListeners();
    } else {
      getAllProductsByCategoryLoading = false;
      log('Request failed with status: ${response.statusCode}.');
      notifyListeners();
    }

    notifyListeners();

    return null;
  }
}
