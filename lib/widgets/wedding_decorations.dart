import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_constants.dart';

class WeddingDecorations extends StatelessWidget {
  const WeddingDecorations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: AppConstants.weddingDecorations.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: Image.asset(
                AppConstants.weddingDecorations[index],
                width: 50,
                height: 50,
                color: Colors.white,
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 500)).scale(begin: const Offset(0.8, 0.8));
        },
      ),
    );
  }
} 