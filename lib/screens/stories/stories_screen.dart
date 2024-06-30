import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:souq_alqua/screens/stories/provider/blog_provider.dart';
import 'package:souq_alqua/screens/stories/screens/blog_detail_screen.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<StoriesScreen> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    BlogPostProvider blogProvider =
        Provider.of<BlogPostProvider>(context, listen: false);
    super.initState();
    flutterTts = FlutterTts();

    Future.microtask(() {
      if (blogProvider.allPosts.isEmpty) {
        blogProvider.fetchAllPosts();
      } else {}
      if (blogProvider.tags.isEmpty) {
        blogProvider.fetchTagsByIds();
      }
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    // await flutterTts.setSpeechRate(0.5);

    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.black12,
        title: Text(
          'Stories 📚',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body:
          // Blog list
          Consumer<BlogPostProvider>(
        builder: (context, blogProvier, _) => blogProvier.isLoading
            ? Center(
                child:
                    LoadingAnimationWidget.beat(color: Colors.white, size: 30),
              )
            : blogProvier.allPosts.isEmpty
                ? Center(
                    child: Text(
                      'No posts found',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                : ListView.builder(
                    itemCount: blogProvier.allPosts.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlogDetailScreen(
                                postData: blogProvier.allPosts[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: FeaturedImageWidget(
                                  mediaId: blogProvier
                                      .allPosts[index].featuredImage!,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    // tags list
                                    Row(
                                      children: [
                                        Row(
                                          children: List.generate(
                                            blogProvier
                                                .allPosts[index].tags.length,
                                            (idx) => Container(
                                              padding: const EdgeInsets.all(8),
                                              margin: const EdgeInsets.fromLTRB(
                                                  8, 8, 0, 8),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                blogProvier.getTagNameFromId(
                                                    blogProvier.allPosts[index]
                                                        .tags[idx]),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        // audio icon
                                        GestureDetector(
                                          onTap: () => _speak(blogProvier
                                              .allPosts[index].title!),
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            margin: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 8),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Icon(
                                              Icons.volume_up,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.8),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                blogProvier
                                                    .allPosts[index].title!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '2 min read',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            blogProvier.allPosts[index]
                                                        .excerpt ==
                                                    null
                                                ? ""
                                                : blogProvier
                                                    .allPosts[index].excerpt!
                                                    .replaceAll(
                                                    RegExp(r'<[^>]*>'),
                                                    '',
                                                  ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.8),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    '🔥',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
} // import your provider

class FeaturedImageWidget extends StatelessWidget {
  final int mediaId;

  const FeaturedImageWidget({Key? key, required this.mediaId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Provider.of<BlogPostProvider>(context, listen: false)
          .fetchFeaturedImage(mediaId),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/009/007/126/small/document-file-not-found-search-no-result-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('An error occurred: ${snapshot.error}'));
        } else {
          return Image.network(
            snapshot.data!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        }
      },
    );
  }
}
