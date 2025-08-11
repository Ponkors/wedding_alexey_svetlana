import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Прокрутите вниз',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 30,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white70.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: const Duration(seconds: 1)).slideY(begin: 0.3, end: 0);
  }
} 