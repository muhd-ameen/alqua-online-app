import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_alqua/screens/authentication/sign_in/provider/login_provider.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Consumer<LoginProvider>(
            builder: (context, value, child) => CircleAvatar(
              backgroundImage: NetworkImage(value.photoURL ??
                  "https://tse2.mm.bing.net/th/id/OIG1.ZpRhr_xQNYO3SF23JNjx?pid=ImgGn"),
            ),
          ),

          //   Positioned(
          //     right: -16,
          //     bottom: 0,
          //     child: SizedBox(
          //       height: 46,
          //       width: 46,
          //       child: TextButton(
          //         style: TextButton.styleFrom(
          //           foregroundColor: Colors.white,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(50),
          //             side: const BorderSide(color: Colors.white),
          //           ),
          //           backgroundColor: const Color(0xFFF5F6F9),
          //         ),
          //         onPressed: () {},
          //         child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
          //       ),
          //     ),
          //   )
        ],
      ),
    );
  }
}
