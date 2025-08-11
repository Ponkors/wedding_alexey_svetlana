import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(AppConstants.textColorValue),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            color: const Color(AppConstants.textColorValue).withOpacity(0.7),
            letterSpacing: 1,
          ),
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 500))
      .slideY(begin: 0.3, end: 0);
  }
} 