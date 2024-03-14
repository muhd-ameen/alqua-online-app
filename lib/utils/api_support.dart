class ApiSupport {
  static String baseUrl = "https://alqua.online/wp-json/wc/v3/";
  static String consumerKey = "ck_4a4e25e4188bc381dddf7894d6bf720c64bd0991";
  static String consumerSecret = "cs_4259456986bc990635b7af798e5170958e7d930e";

  /// endpoint: products
  static String products = "products";
  static String categories = "products/categories";

  static String productsByCategory({required int categoryId}) {
    return "products?category=$categoryId";
  }
}


