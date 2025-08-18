class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

class Responsive {
  static bool isMobile(double width) => width < Breakpoints.mobile;
  static bool isTablet(double width) =>
      width >= Breakpoints.mobile && width < Breakpoints.tablet;
  static bool isDesktop(double width) => width >= Breakpoints.tablet;

  static double contentMaxWidth(double width) {
    if (width >= 1600) return 1200;
    if (width >= 1400) return 1120;
    if (width >= 1200) return 1040;
    if (width >= 1000) return 960;
    return width;
  }

  static double horizontalPadding(double width) {
    if (width >= Breakpoints.tablet) return 32;
    if (width >= Breakpoints.mobile) return 24;
    return 16;
  }
}
