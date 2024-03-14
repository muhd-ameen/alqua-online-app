import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/utils/color_class.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "صفقة فلاش"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "فاتورة"},
      {"icon": "assets/icons/Game Icon.svg", "text": "لعبة"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "هدية يومية"},
      {"icon": "assets/icons/Discover.svg", "text": "أكثر"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
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
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: ColorClass.primaryGradientColor2.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              icon,
              // ignore: deprecated_member_use
              color: ColorClass.kPrimaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
