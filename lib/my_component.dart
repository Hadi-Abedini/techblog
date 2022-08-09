import 'package:flutter/material.dart';
import 'my_Colors.dart';

class tecDivider extends StatelessWidget {
  const tecDivider({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1,
    );
  }
}
