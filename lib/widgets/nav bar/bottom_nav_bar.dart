import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/widgets/background%20design/nav_bar_background.dart';
import '../../pages/search_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const NavBarBackground(),
        Positioned(
          top: -1.5.h,
          left: 20.w,
          right: 20.w,
          child: ClipPath(
            clipper: ChildClipper(),
            child: Container(
              color: const Color(0xFF373A6A),
              height: 12.5.h,
              child: Transform.scale(
                scale: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF5E4CA7),
                      width: 3,
                    ),
                  ),
                  child: FloatingActionButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, SearchPage.id);
                    },
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.search_rounded,
                      color: const Color(0xFF5E4CA7),
                      size: 15.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ChildClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.quadraticBezierTo(w * 0.85, h * 0.90, w * 0.75, h * 0.3);
    path.quadraticBezierTo(w * 0.70, h * 0.05, w * 0.65, h * 0.02);
    path.quadraticBezierTo(w * 0.50, 0, w * 0.35, h * 0.02);
    path.quadraticBezierTo(w * 0.30, h * 0.05, w * 0.25, h * 0.3);
    path.quadraticBezierTo(w * 0.15, h * 0.90, 0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
