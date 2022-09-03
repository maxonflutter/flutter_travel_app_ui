import 'package:flutter/material.dart';

class ClippedContainer extends StatelessWidget {
  const ClippedContainer({
    Key? key,
    this.height = 400,
    this.color,
    this.imageUrl,
  }) : super(key: key);

  final double height;
  final Color? color;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipper(),
      child: Container(
        height: height,
        color: (imageUrl == null) ? const Color(0xFFE8AA42) : null,
        decoration: (imageUrl != null)
            ? BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  Path _getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.70);
    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.85,
      size.width * 0.30,
      size.height * 0.85,
    );
    path.lineTo(size.width * 0.70, size.height * 0.85);
    path.quadraticBezierTo(
      size.width * 0.90,
      size.height * 0.85,
      size.width * 1,
      size.height * 1,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) => _getClip(size);
}
