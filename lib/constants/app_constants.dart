class AppConstants {
  static const String brideName = 'Светлана';
  static const String groomName = 'Алексей';
  static final DateTime weddingDate = DateTime(2025, 10, 04, 0, 0);
  static const String weddingDateString = '4 октября 2025 15:00';
  static const String weddingLocation = 'Усадьба Полховских';
  static const String weddingAddress = 'д. Прилуки, ул. Береговая 15';

  // Цветовая схема
  static const int primaryColorValue = 0xFF2E7D32; // Зеленый
  static const int secondaryColorValue = 0xFFE8F5E9; // Светло-зеленый
  static const int accentColorValue = 0xFFD4AF37; // Золотой
  static const int textColorValue = 0xFF2C3E50; // Темно-синий
  static const int backgroundColorValue = 0xFFF8F9FA; // Светло-серый

  // Пути к изображениям
  static const String heroBackgroundImage = 'assets/images/hero_bg2.jpg';
  static const String brideImage = 'assets/images/bride.jpg';
  static const String groomImage = 'assets/images/groom.jpg';
  static const String storyImage1 = 'assets/images/story1.jpg';
  static const String storyImage2 = 'assets/images/story2.jpg';
  static const String storyImage3 = 'assets/images/story3.jpg';
  static const String venueImage = 'assets/images/venue.jpg';
  static const String galleryImage1 = 'assets/images/gallery1.jpg';
  static const String galleryImage2 = 'assets/images/gallery2.jpg';
  static const String galleryImage3 = 'assets/images/gallery3.jpg';
  static const String galleryImage4 = 'assets/images/gallery4.jpg';
  static const String galleryImage5 = 'assets/images/gallery5.jpg';
  static const String galleryImage6 = 'assets/images/gallery6.jpg';

  // Свадебная атрибутика
  static const String flowersImage = 'assets/images/flowers.png';
  static const String ringsImage = 'assets/images/rings.png';
  static const String heartImage = 'assets/images/heart.png';
  static const String loveImage = 'assets/images/love.png';
  static const String weddingCakeImage = 'assets/images/wedding_cake.png';
  static const String champagneImage = 'assets/images/champagne.png';

  // Тексты
  static const String invitationText = 'Приглашают вас на нашу свадьбу';
  static const String countDownTimerText = 'До нашей даты осталось';
  static const String locationTitleText = 'Локация';
  static const String aboutBrideText =
      'Valeria - нежная, умная и красивая девушка, которая вдохновляет меня каждый день. С ней каждый день становится особенным.';
  static const String aboutGroomText =
      'Мы встретились в прекрасный летний день и с тех пор не расстаемся. Vladislav - добрый, заботливый и любящий человек, который всегда поддержит и поможет.';
  static const String storyText =
      'Наша история началась в прекрасный летний день. С тех пор каждый момент вместе наполнен радостью и счастьем. Мы рады разделить этот особенный день с вами.';

  // Расписание
  static const List<Map<String, String>> schedule = [
    {
      'time': '14:00',
      'title': 'Сбор гостей',
      'description': 'Встреча гостей, фотосессия',
    },
    {
      'time': '15:00',
      'title': 'Церемония',
      'description': 'Торжественная церемония бракосочетания',
    },
    {
      'time': '16:00',
      'title': 'Банкет',
      'description': 'Праздничный ужин и развлекательная программа',
    },
    {
      'time': '19:00',
      'title': 'Торт',
      'description': 'Традиционная церемония разрезания свадебного торта',
    },
  ];

  // Список фотографий для галереи
  static const List<String> galleryImages = [
    galleryImage1,
    galleryImage2,
    galleryImage3,
    galleryImage4,
    galleryImage5,
    galleryImage6,
  ];

  // Список фотографий для истории
  static const List<String> storyImages = [
    storyImage1,
    storyImage2,
    storyImage3,
  ];

  // Список свадебной атрибутики
  static const List<String> weddingDecorations = [
    flowersImage,
    ringsImage,
    heartImage,
    loveImage,
    weddingCakeImage,
    champagneImage,
  ];

  // Координаты места проведения
  static const double weddingLatitude = 51.993088;
  static const double weddingLongitude = 23.713276;

  // Ссылка на Яндекс.Карты
  static String getYandexMapsUrl() {
    return 'https://yandex.ru/maps/?pt=$weddingLongitude,$weddingLatitude&z=16&l=map';
  }

  // Ссылка на навигацию
  static String getYandexNavigatorUrl() {
    return 'yandexnavi://build_route_on_map?lat_to=$weddingLatitude&lon_to=$weddingLongitude';
  }

  static const String churchImage = 'assets/images/church.jpg';
  static const String churchName = 'Гарнизонный храм \nБрестской крепости';
  static const String churchTime = '12:50';
  static const String churchAddress = 'Брестская крепость, г. Брест';
}
