import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import 'section_title.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  bool _isMapLoaded = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    // Имитация загрузки карты
    Future.delayed(500.ms, () => setState(() => _isMapLoaded = true));
  }

  Future<void> _launchMap() async {
    final url = Uri.parse(AppConstants.getYandexMapsUrl());
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  String _getStaticMapUrl() {
    final lat = AppConstants.weddingLatitude;
    final lng = AppConstants.weddingLongitude;
    return 'https://static-maps.yandex.ru/1.x/?ll=$lng,$lat&z=15&size=650,400&l=map&pt=$lng,$lat,pm2dol1';
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final cardPadding = isSmallScreen ? 20.0 : 30.0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isSmallScreen ? 20 : 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.grey[50]!,
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: AppConstants.locationTitleText,
            subtitle: 'Место проведения торжества',
          ),
          const SizedBox(height: 50),

          // Интерактивная карта
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: GestureDetector(
              onTap: _launchMap,
              child: AnimatedContainer(
                duration: 300.ms,
                height: isSmallScreen ? 220 : 300,
                margin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(_isHovered ? 0.2 : 0.1),
                      blurRadius: _isHovered ? 20 : 10,
                      offset: Offset(0, _isHovered ? 8 : 4),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (_isMapLoaded)
                        Image.network(
                          _getStaticMapUrl(),
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, progress) {
                            return progress == null
                                ? child
                                : Center(child: CircularProgressIndicator());
                          },
                        )
                      else
                        Center(child: CircularProgressIndicator()),

                      // Затемнение при наведении
                      if (_isHovered)
                        Container(
                          color: Colors.black.withOpacity(0.2),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Открыть в Яндекс.Картах',
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuart),

          const SizedBox(height: 40),

          // Карточка с информацией
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 40),
            padding: EdgeInsets.all(cardPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  icon: Icons.location_on_rounded,
                  iconColor: Colors.redAccent,
                  title: 'Место проведения',
                  subtitle: AppConstants.weddingLocation,
                  description: AppConstants.weddingAddress,
                ),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Colors.grey),
                const SizedBox(height: 20),
                _buildInfoRow(
                  icon: Icons.calendar_today_rounded,
                  iconColor: Colors.blueAccent,
                  title: 'Дата и время',
                  subtitle: AppConstants.weddingDateString,
                  description: 'Рекомендуем прибыть за 30 минут до начала',
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuart),

          const SizedBox(height: 30),

          // Кнопка маршрута
          ElevatedButton(
            onPressed: _launchMap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3366FF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.directions, size: 20),
                const SizedBox(width: 10),
                Text(
                  'Построить маршрут',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: 400.ms, duration: 600.ms)
              .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuart)
              .shimmer(delay: 800.ms, duration: 1000.ms),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    String? description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              if (description != null) ...[
                const SizedBox(height: 6),
                Text(
                  description,
                  style: GoogleFonts.raleway(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}