import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';

class ScheduleSlider extends StatefulWidget {
  final GlobalKey locationKey;

  const ScheduleSlider({
    super.key,
    required this.locationKey,
  });

  @override
  State<ScheduleSlider> createState() => _ScheduleSliderState();
}

class _ScheduleSliderState extends State<ScheduleSlider> {
  int _currentIndex = 0;
  late PageController _pageController;
  double _page = 0;
  final List<Map<String, dynamic>> _schedules = [
    {
      'time': '11:00',
      'title': 'Выкуп невесты',
      'location': 'Большие Радваничи',
      'address': 'д. Большие Радваничи, ул. Комсомольская, 2',
      'image': 'assets/images/wedding_wife_home.jpg',
      'icon': Icons.people,
      'color': Colors.blue.shade100,
    },
    {
      'time': '12:20',
      'title': 'Регистрация союза',
      'location': 'ЗАГС',
      'address': 'г. Брест, наб.Франциска Скорины, 38',
      'image': 'assets/images/wedding_registration.jpg',
      'icon': Icons.people,
      'color': Colors.blue.shade100,
    },
    {
      'time': '15:00',
      'title': 'Банкет',
      'location': 'Усадьба Полховских',
      'address': 'д. Прилуки, ул. Береговая 15',
      'image': 'assets/images/wedding_place.jpg',
      'icon': Icons.people,
      'color': Colors.pink.shade100,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8)
      ..addListener(() {
        setState(() {
          _page = _pageController.page ?? 0;
        });
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollToLocation() {
    final context = widget.locationKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: 500.ms,
        curve: Curves.easeInOut,
      );
    }
  }

  void _goTo(int index) {
    _pageController.animateToPage(
      index.clamp(0, _schedules.length - 1),
      duration: 350.ms,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.grey.shade50,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Расписание дня',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 28 : 40,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ).animate().fadeIn(),
          const SizedBox(height: 8),
          Text(
            'Наши самые важные моменты',
            style: GoogleFonts.raleway(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
              letterSpacing: 0.2,
            ),
          ).animate().fadeIn(delay: 100.ms),
          const SizedBox(height: 40),

          // Карусель с глубиной и параллаксом
          SizedBox(
            height: isSmallScreen ? 520 : 600,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemCount: _schedules.length,
                  itemBuilder: (context, index) {
                    final schedule = _schedules[index];
                    final delta = (index - _page);
                    final isFocused = index == _currentIndex;
                    final rotationY =
                        isSmallScreen ? 0.0 : delta.clamp(-1.0, 1.0) * 0.12;
                    final scale = 1 - (delta.abs() * 0.06);
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(rotationY)
                        ..scale(scale),
                      child: _buildParallaxCard(
                        context,
                        schedule,
                        isSmallScreen,
                        delta,
                        isFocused,
                      ),
                    );
                  },
                ),
                if (!isSmallScreen) ...[
                  Positioned(
                    left: 0,
                    child: _NavArrow(
                      icon: Icons.chevron_left,
                      onTap: () => _goTo(_currentIndex - 1),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: _NavArrow(
                      icon: Icons.chevron_right,
                      onTap: () => _goTo(_currentIndex + 1),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Индикаторы с анимацией (pill)
          Wrap(
            spacing: 8,
            children: List.generate(_schedules.length, (index) {
              final active = _currentIndex == index;
              return AnimatedContainer(
                duration: 250.ms,
                curve: Curves.easeOut,
                width: active ? 26 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active
                      ? const Color(AppConstants.primaryColorValue)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildParallaxCard(
    BuildContext context,
    Map<String, dynamic> schedule,
    bool isSmallScreen,
    double delta,
    bool isFocused,
  ) {
    final imageParallax = delta * -20;
    final shadowOpacity = isFocused ? 0.16 : 0.06;
    final borderColor =
        const Color(AppConstants.primaryColorValue).withOpacity(0.08);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(shadowOpacity),
            blurRadius: 40,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          children: [
            // Фоновое изображение с параллаксом
            Transform.translate(
              offset: Offset(imageParallax, 0),
              child: Image.asset(
                schedule['image'],
                height: isSmallScreen ? 520 : 600,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Градиент для читабельности
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.25),
                      Colors.black.withOpacity(0.45),
                    ],
                  ),
                ),
              ),
            ),

            // Время в виде чипа
            Positioned(
              top: 18,
              left: 18,
              child: _GlassChip(
                child: Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      schedule['time'],
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Панель с информацией (glassmorphism)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: _GlassPanel(
                borderColor: borderColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                schedule['title'],
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: isSmallScreen ? 22 : 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.place,
                                      size: 16, color: Colors.white70),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      schedule['location'],
                                      style: GoogleFonts.raleway(
                                        fontSize: isSmallScreen ? 13 : 14,
                                        color: Colors.white.withOpacity(0.9),
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const SizedBox(width: 22),
                                  Expanded(
                                    child: Text(
                                      schedule['address'],
                                      style: GoogleFonts.raleway(
                                        fontSize: isSmallScreen ? 12 : 13,
                                        color: Colors.white70,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        _GlassIconButton(
                          icon: Icons.map,
                          tooltip: 'Показать локацию',
                          onTap: _scrollToLocation,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: 28, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

class _GlassPanel extends StatelessWidget {
  final Widget child;
  final Color? borderColor;

  const _GlassPanel({required this.child, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                color: borderColor ?? Colors.white.withOpacity(0.12)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassChip extends StatelessWidget {
  final Widget child;
  const _GlassChip({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _GlassIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Material(
            color: Colors.white.withOpacity(0.14),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
