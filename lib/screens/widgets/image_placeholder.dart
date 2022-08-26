import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 300,
      width: 300,
      child: Placeholder(
        color: AddingConcertColors.darkBlue,
      ),
    );
  }
}
