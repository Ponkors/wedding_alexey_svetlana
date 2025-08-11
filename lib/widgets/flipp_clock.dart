import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../utils/date_utils.dart' as custom_date_utils;

class FlippClock extends StatefulWidget {
  const FlippClock({super.key});

  @override
  State<FlippClock> createState() => _FlippClockState();
}

class _FlippClockState extends State<FlippClock> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    
    final titleFontSize = isSmallScreen ? size.width * 0.045 : 24.0;
    final numberFontSize = isSmallScreen ? size.width * 0.08 : 72.0;
    final labelFontSize = isSmallScreen ? size.width * 0.03 : 16.0;

    return Column(
      children: [
        Text(
          AppConstants.countDownTimerText,
          style: GoogleFonts.playfairDisplay(
            fontSize: titleFontSize,
            color: Colors.white70,
            letterSpacing: 2,
            fontWeight: FontWeight.w300,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeBlock(
              custom_date_utils.DateUtils.getDaysUntil(AppConstants.weddingDate),
              'Дней',
              numberFontSize,
              labelFontSize,
            ),
            _buildSeparator(),
            _buildTimeBlock(
              custom_date_utils.DateUtils.getHoursUntil(AppConstants.weddingDate),
              'Часов',
              numberFontSize,
              labelFontSize,
            ),
            _buildSeparator(),
            _buildTimeBlock(
              custom_date_utils.DateUtils.getMinutesUntil(AppConstants.weddingDate),
              'Минут',
              numberFontSize,
              labelFontSize,
            ),
            _buildSeparator(),
            _buildTimeBlock(
              custom_date_utils.DateUtils.getSecondsUntil(AppConstants.weddingDate),
              'Секунд',
              numberFontSize,
              labelFontSize,
            ),
          ],
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 1000)).slideY(begin: 0.3, end: 0);
  }

  Widget _buildTimeBlock(int value, String label, double numberFontSize, double labelFontSize) {
    return Column(
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: GoogleFonts.playfairDisplay(
            fontSize: numberFontSize,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            letterSpacing: 1,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.playfairDisplay(
            fontSize: labelFontSize,
            color: Colors.white70,
            letterSpacing: 2,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        ':',
        style: GoogleFonts.playfairDisplay(
          fontSize: 36,
            color: Colors.white70,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
} 