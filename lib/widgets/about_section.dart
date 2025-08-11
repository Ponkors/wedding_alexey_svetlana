import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width > 600 ? 80 : 40,
      ),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          final imageSize = isSmallScreen ? 150.0 : 200.0;
          final fontSize = isSmallScreen ? 20.0 : 24.0;
          final descriptionFontSize = isSmallScreen ? 14.0 : 16.0;
          final horizontalPadding = isSmallScreen ? 16.0 : 20.0;
          final verticalSpacing = isSmallScreen ? 30.0 : 60.0;

          return Column(
            children: [
              const SectionTitle(
                title: 'О нас',
                subtitle: 'Познакомьтесь с нами поближе',
              ),
              SizedBox(height: verticalSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: isSmallScreen
                    ? Column(
                        children: [
                          _buildPersonCard(
                            imageSize: imageSize,
                            fontSize: fontSize,
                            descriptionFontSize: descriptionFontSize,
                            image: AppConstants.brideImage,
                            name: AppConstants.brideName,
                            description: AppConstants.aboutBrideText,
                            slideDirection: 0.3,
                          ),
                          SizedBox(height: verticalSpacing),
                          _buildPersonCard(
                            imageSize: imageSize,
                            fontSize: fontSize,
                            descriptionFontSize: descriptionFontSize,
                            image: AppConstants.groomImage,
                            name: AppConstants.groomName,
                            description: AppConstants.aboutGroomText,
                            slideDirection: -0.3,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: _buildPersonCard(
                              imageSize: imageSize,
                              fontSize: fontSize,
                              descriptionFontSize: descriptionFontSize,
                              image: AppConstants.brideImage,
                              name: AppConstants.brideName,
                              description: AppConstants.aboutBrideText,
                              slideDirection: 0.3,
                            ),
                          ),
                          SizedBox(width: isSmallScreen ? 20 : 40),
                          Expanded(
                            child: _buildPersonCard(
                              imageSize: imageSize,
                              fontSize: fontSize,
                              descriptionFontSize: descriptionFontSize,
                              image: AppConstants.groomImage,
                              name: AppConstants.groomName,
                              description: AppConstants.aboutGroomText,
                              slideDirection: -0.3,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPersonCard({
    required double imageSize,
    required double fontSize,
    required double descriptionFontSize,
    required String image,
    required String name,
    required String description,
    required double slideDirection,
  }) {
    return Column(
      children: [
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
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
        ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideX(
              begin: slideDirection,
              end: 0,
            ),
        const SizedBox(height: 20),
        Text(
          name,
          style: GoogleFonts.playfairDisplay(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(AppConstants.textColorValue),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: descriptionFontSize,
            color: const Color(AppConstants.textColorValue).withOpacity(0.8),
            height: 1.6,
          ),
        ),
      ],
    );
  }
} 