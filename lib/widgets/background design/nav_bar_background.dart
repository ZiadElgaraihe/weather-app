import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavBarBackground extends StatelessWidget {
  const NavBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
          clipper: ParentClipper(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2F1C76),
                  Color(0xFF580F96),
                  Color(0xFF780AB0),
                ],
              ),
            ),
            width: double.infinity,
            height: 11.h,
          ),
        );
  }
}

class ParentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;
    path.lineTo(0, 0);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(w * 0.5, h * 0.5, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
