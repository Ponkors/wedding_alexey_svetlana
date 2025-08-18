import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 600;
    final titleFontSize = isSmallScreen ? 32.0 : 48.0;
    final textFontSize = isSmallScreen ? 16.0 : 18.0;
    final horizontalPadding = Responsive.horizontalPadding(width);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width > 600 ? 80 : 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.05,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: Responsive.contentMaxWidth(width)),
            child: Column(
              children: [
                _buildDecorativeLine(),
                const SizedBox(height: 20),
                Text(
                  'Дорогие друзья',
                  style: GoogleFonts.dancingScript(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                    color: const Color(AppConstants.textColorValue),
                    letterSpacing: 1,
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 800))
                    .scale(begin: const Offset(0.8, 0.8)),
                const SizedBox(height: 30),
                _buildDecorativeElement(),
                const SizedBox(height: 30),
                Text(
                  'Жить, любить, чувствовать...',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dancingScript(
                    fontSize: textFontSize + 4,
                    color: const Color(AppConstants.textColorValue),
                    height: 1.8,
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 800))
                    .slideY(begin: 0.2, end: 0),
                const SizedBox(height: 20),
                Text(
                  'Однажды мы поняли, что нет ничего важнее этого. И что идти дальше мы хотим только вместе. А теперь мечтаем, чтобы день нашей свадьбы стал красивым и ярким событием на этом увлекательном пути.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: textFontSize,
                    color: const Color(AppConstants.textColorValue)
                        .withOpacity(0.8),
                    height: 1.8,
                    fontStyle: FontStyle.italic,
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 800))
                    .slideY(begin: 0.2, end: 0),
                const SizedBox(height: 20),
                Text(
                  'Мы будем очень рады, если вы разделите этот счастливый день с нами.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: textFontSize,
                    color: const Color(AppConstants.textColorValue)
                        .withOpacity(0.8),
                    height: 1.8,
                    fontStyle: FontStyle.italic,
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 800))
                    .slideY(begin: 0.2, end: 0),
                const SizedBox(height: 20),
                Text(
                  'Увидимся на нашей свадьбе!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dancingScript(
                    fontSize: textFontSize + 4,
                    color: const Color(AppConstants.textColorValue),
                    height: 1.8,
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 800))
                    .slideY(begin: 0.2, end: 0),
                const SizedBox(height: 20),
                _buildDecorativeLine(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDecorativeLine() {
    return Container(
      width: 100,
      height: 1,
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
    ).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }

  Widget _buildDecorativeElement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color:
                  const Color(AppConstants.primaryColorValue).withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 30,
          height: 1,
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
        ),
        const SizedBox(width: 10),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color:
                  const Color(AppConstants.primaryColorValue).withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 500))
        .scale(begin: const Offset(0.8, 0.8));
  }
}
