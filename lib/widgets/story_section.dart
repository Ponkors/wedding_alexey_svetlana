import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: const Color(AppConstants.backgroundColorValue),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Наша история',
            subtitle: 'История нашей любви',
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppConstants.storyText,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 18,
                color: const Color(AppConstants.textColorValue),
                height: 1.8,
              ),
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: AppConstants.storyImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(AppConstants.storyImages[index]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideX(begin: 0.3, end: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
} 