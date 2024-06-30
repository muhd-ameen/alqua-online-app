import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon":
            "https://tse4.mm.bing.net/th/id/OIG3.XEuZFpYHoH2vNvNE1ad2?pid=ImgGn",
        "text": "Classic"
      },
      {
        "icon":
            "https://tse3.mm.bing.net/th/id/OIG3.Y5ldf5zsB5F1bFlYIpiy?pid=ImgGn",
        "text": "Sports"
      },
      {
        "icon":
            "https://tse1.mm.bing.net/th/id/OIG3.O2EvsY97e842Uw6yWFlq?pid=ImgGn",
        "text": "Off-Road"
      },
      {
        "icon":
            "https://tse2.mm.bing.net/th/id/OIG3.M0ZMRl0xPzVg.1j6eQ_t?pid=ImgGn",
        "text": "Fantasy"
      },
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(
                      0.5), // You can set the color and opacity as per your preference
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(
                      0, 3), // Offset to control the position of the shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
