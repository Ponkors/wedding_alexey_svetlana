import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';
import 'section_divider.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final textFontSize = isSmallScreen ? 16.0 : 18.0;
    final padding = isSmallScreen ? 20.0 : 40.0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(AppConstants.backgroundColorValue),
            const Color(AppConstants.backgroundColorValue).withOpacity(0.9),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionDivider(),
          const SectionTitle(
            title: 'Детали мероприятия',
            subtitle: 'Важная информация для гостей',
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildDetailCard(
                context: context,
                icon: Icons.card_giftcard,
                title: "Пожелания по подаркам",
                description: "Вместо традиционных цветов мы будем рады:",
                items: [
                  '📚 Книгам для нашей библиотеки',
                  '🍷 Вину для особых случаев',
                  '🎮 Настольным играм для вечеров',
                ],
                fontSize: textFontSize,
                color: Colors.amber.shade50,
              ),
              _buildDetailCard(
                context: context,
                icon: Icons.directions_bus,
                title: "Трансфер",
                description: "Для вашего удобства будет организован трансфер от места сбора до места проведения мероприятия.",
                fontSize: textFontSize,
                color: Colors.lightBlue.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    List<String>? items,
    required double fontSize,
    required Color color,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width < 600 ? double.infinity : 400,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(AppConstants.primaryColorValue),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: fontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: const Color(AppConstants.textColorValue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: GoogleFonts.raleway(
              fontSize: fontSize,
              color: const Color(AppConstants.textColorValue),
              height: 1.6,
            ),
          ),
          if (items != null) ...[
            const SizedBox(height: 15),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  Text(
                    item,
                    style: GoogleFonts.raleway(
                      fontSize: fontSize,
                      color: const Color(AppConstants.textColorValue),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).scale(
      begin: const Offset(0.9, 0.9),
      end: const Offset(1, 1),
      curve: Curves.easeOutBack,
    );
  }
}