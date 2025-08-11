import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(AppConstants.primaryColorValue).withOpacity(0.1),
            const Color(AppConstants.primaryColorValue).withOpacity(0.3),
            const Color(AppConstants.primaryColorValue).withOpacity(0.1),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
