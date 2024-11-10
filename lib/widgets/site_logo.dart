import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onBtnTap,
  });
  final VoidCallback? onBtnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBtnTap,
      child: const Text(
        "LM",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: CustomColor.yellowSecondary,
        ),
      ),
    );
  }
}
