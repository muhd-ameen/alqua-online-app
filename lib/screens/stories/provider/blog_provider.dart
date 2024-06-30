import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:souq_alqua/utils/api_support.dart';

class BlogPostProvider extends ChangeNotifier {
  Future<List<Tag>> getAllTags() async {
    var url = Uri.parse(ApiSupport.wpBaseUrl + ApiSupport.tags);
    var headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('${ApiSupport.consumerKey}:${ApiSupport.consumerSecret}'))}',
    };
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((tag) => Tag.fromJson(tag)).toList();
    } else {
      throw Exception('Failed to load tags');
    }
  }

  getTagNameFromId(int tagId) {
    var tag = tags.firstWhere((element) => element.id == tagId);
    return tag.name;
  }

  Future<List<Post>> getAllPosts() async {
    var url = Uri.parse(ApiSupport.wpBaseUrl + ApiSupport.posts);
    var headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('${ApiSupport.consumerKey}:${ApiSupport.consumerSecret}'))}',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  List<Tag> tags = [];
  bool isLoadingTags = false;

  Future<void> fetchTagsByIds() async {
    isLoadingTags = true;
    notifyListeners();

    try {
      tags = await getAllTags();
    } catch (error) {
      tags = [];
      rethrow;
    } finally {
      isLoadingTags = false;
      notifyListeners();
    }
  }

  List<Post> allPosts = [];
  bool isLoading = false;

  Future<void> fetchAllPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      allPosts = await getAllPosts();
    } catch (error) {
      allPosts = [];
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String> fetchFeaturedImage(int mediaId) async {
    try {
      var url = Uri.parse(
          ApiSupport.wpBaseUrl + ApiSupport.getFeaturedImage(imageId: mediaId));
      var headers = {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${ApiSupport.consumerKey}:${ApiSupport.consumerSecret}'))}',
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var featuredImageUrl = data['source_url'];
        log('Featured Image URL: $featuredImageUrl');
        return featuredImageUrl;
      } else {
        throw Exception('Failed to load media: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load media: $error');
    }
  }
}

class Tag {
  final int id;
  final String name;
  final String slug;

  Tag({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class Post {
  final int id;
  final DateTime? date;
  final String? title;
  final String? content;
  final String? excerpt;
  final int? featuredImage;
  final List<int> tags;

  Post({
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.featuredImage,
    required this.tags,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      date: DateTime.parse(json['date']),
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      excerpt: json['excerpt']['rendered'],
      featuredImage: json['featured_media'],
      tags: json['tags'] == null ? [] : List<int>.from(json['tags']),
    );
  }
}
