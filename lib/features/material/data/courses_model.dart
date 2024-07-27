class CoursesModel {
  final String courseName;
  final String numberOfVideos;
  final String isFree;
  final double rate;
  final String url;

  CoursesModel({
    required this.courseName,
    required this.numberOfVideos,
    required this.isFree,
    required this.rate,
    required this.url,
  });
  static List<CoursesModel> courseList = [
    CoursesModel(
      courseName: 'Learn English Pronunciation | Master Course',
      numberOfVideos: '37',
      isFree: 'Free',
      rate: 3,
      url:
          'https://www.youtube.com/playlist?list=PL2IkMHFHWdEpVXEVB3PzzNIDBQt6SwziE',
    ),
    CoursesModel(
      courseName: 'English Pronunciation Course - learn all English sounds',
      numberOfVideos: '47',
      isFree: 'Free',
      rate: 2,
      url:
          'https://youtube.com/playlist?list=PLxSMFOK97J0MBwyzEyEYOi_3zxtVCFr-2&si=kaUiV4jL3H5jbyha',
    ),
    CoursesModel(
      courseName: 'English Pronunciation Lessons',
      numberOfVideos: '16',
      isFree: 'Free',
      rate: 4,
      url:
          'https://www.youtube.com/playlist?list=PLD6t6ckHsrubLp8Ia8duzu5fN4riM2-Bl',
    ),
    CoursesModel(
      courseName: 'English Pronunciation Lessons',
      numberOfVideos: '16',
      isFree: 'Free',
      rate: 5,
      url:
          'https://youtube.com/playlist?list=PLD6t6ckHsrubLp8Ia8duzu5fN4riM2-Bl&si=Y4cGNb8V_gR7uZjS',
    ),
    CoursesModel(
      courseName: 'The Sounds of English',
      numberOfVideos: '45',
      isFree: 'Free',
      rate: 4,
      url:
          'https://youtube.com/playlist?list=PLD6B222E02447DC07&si=AQ7CPt7Ep6KgRaas',
    ),
    CoursesModel(
      courseName: 'Perfect English Pronunciation: British English',
      numberOfVideos: '45',
      isFree: 'Paid',
      rate: 5,
      url:
          'https://www.udemy.com/course/perfect-pronunciation-british-english/?couponCode=LETSLEARNNOW',
    ),
    CoursesModel(
      courseName: 'American English Pronunciation',
      numberOfVideos: '18',
      isFree: 'Paid',
      rate: 4,
      url:
          'https://www.udemy.com/course/basic-american-pronunciation/?couponCode=LETSLEARNNOW',
    ),
    CoursesModel(
      courseName: 'English Pronunciation | Sound Like a Native English Speaker',
      numberOfVideos: '16',
      isFree: 'Paid',
      rate: 5,
      url:
          'https://www.udemy.com/course/improving-your-english-fluency/?couponCode=LETSLEARNNOW',
    ),
    CoursesModel(
      courseName: 'English Pronunciation - Complete Guide to English Speaking',
      numberOfVideos: '58',
      isFree: 'Paid',
      rate: 3,
      url:
          'https://www.udemy.com/course/british-english-pron/?couponCode=LETSLEARNNOW',
    ),
    CoursesModel(
      courseName: 'Advanced American English Pronunciation | Complete Mastery',
      numberOfVideos: '50',
      isFree: 'Paid',
      rate: 5,
      url:
          'https://www.udemy.com/course/advanced-american-pronunciation/?couponCode=LETSLEARNNOW',
    ),
  ];
}
