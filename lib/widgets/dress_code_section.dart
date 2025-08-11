import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';

class DressCodeSection extends StatelessWidget {
  const DressCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Дресс-код',
            subtitle: '',
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Нам будет особенно приятно, если ты поддержишь пастельный дресс-код нашей свадьбы:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    color: const Color(AppConstants.textColorValue),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                _buildColorPalette(),
                const SizedBox(height: 40),
                _buildColorPalette1(),
                const SizedBox(height: 40),
                _buildDressCodeInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPalette() {
    final colors = [
      const Color(0xFFF8E8E8), // Светло-розовый
      const Color(0xFFE8F4F8), // Светло-голубой
      const Color(0xFFF0F8E8), // Светло-зеленый
      const Color(0xFFF8F0E8), // Светло-бежевый
      const Color(0xFFF0E8F8), // Светло-лавандовый
    ];

    return Column(
      children: [
        Text(
          'Рекомендуемые цвета',
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            color: const Color(AppConstants.textColorValue),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colors.map((color) {
            return Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: const Duration(milliseconds: 500)).scale(begin: const Offset(0.8, 0.8));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorPalette1() {
    final colors = [
      const Color(0xFFFFFFFF), // Белый
      const Color(0xFF828282), // Светло-серый
      const Color(0xFF000000), // Светло-черный
  
    ];

    return Column(
      children: [
        Text(
          'Для мужчин также:',
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            color: const Color(AppConstants.textColorValue),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colors.map((color) {
            return Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: const Duration(milliseconds: 500)).scale(begin: const Offset(0.8, 0.8));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDressCodeInfo() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(AppConstants.backgroundColorValue),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDressCodeItem(
            icon: Icons.info_outline,
            title: 'Важно',
            description: 'Пожалуйста, избегайте ярких и контрастных цветов',
          ),
          const SizedBox(height: 20),
          _buildDressCodeItem(
            icon: Icons.info_outline,
            description: 'Не забудьте прихватить удобную обувь для загородной усадьбы и большого количества танцев',
          ),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 800)).slideY(begin: 0.2, end: 0);
  }

  Widget _buildDressCodeItem({
    required IconData icon,
    String? title, // теперь необязательный
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: const Color(AppConstants.primaryColorValue),
          size: 24,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null && title.trim().isNotEmpty) ...[
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(AppConstants.textColorValue),
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                description,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  color: const Color(AppConstants.textColorValue).withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 