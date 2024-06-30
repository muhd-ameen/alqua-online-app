import 'package:flutter/material.dart';
import 'package:souq_alqua/screens/stories/stories_screen.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const StoriesScreen();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://tse3.mm.bing.net/th/id/OIG3.b5z4uTfDgg1NT0lUEPk8?pid=ImgGn",
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Title as "Read & Buy"
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Text(
                  "Tales & Toys Hub",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
