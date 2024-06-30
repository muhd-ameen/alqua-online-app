import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:souq_alqua/screens/stories/stories_screen.dart';
import 'package:souq_alqua/screens/stories/provider/blog_provider.dart';

class BlogDetailScreen extends StatefulWidget {
  final Post postData;

  const BlogDetailScreen({super.key, required this.postData});

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.postData.title ?? "",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // featured image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FeaturedImageWidget(
                  mediaId: widget.postData.featuredImage!,
                ),
              ),
            ),
            Html(
              data: widget.postData.content,
              style: {
                "img": Style(
                  display: Display.block,
                  margin: Margins.symmetric(horizontal: 25, vertical: 10),
                  textAlign: TextAlign.center,
                  height: Height(260),
                  width: Width(300),
                ),
                "p": Style(
                  fontSize: FontSize(16),
                  color: Colors.white,
                ),
                "h1": Style(
                  fontSize: FontSize(20),
                  color: Colors.white,
                ),
                "h2": Style(
                  fontSize: FontSize(18),
                  color: Colors.white,
                ),
                "h3": Style(
                  fontSize: FontSize(16),
                  color: Colors.white,
                ),
                "h4": Style(
                  fontSize: FontSize(14),
                  color: Colors.white,
                ),
                "h5": Style(
                  fontSize: FontSize(12),
                  color: Colors.white,
                ),
                "h6": Style(
                  fontSize: FontSize(10),
                  color: Colors.white,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
