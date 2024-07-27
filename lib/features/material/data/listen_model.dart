class ListenModel {
  final String webSiteName;
  final String url;
  final String description;
  ListenModel({
    required this.webSiteName,
    required this.url,
    required this.description,
  });
  static List<ListenModel> listeningListen = [
    ListenModel(
      url: 'https://english-practice.net/listening-exercises-b1/',
      webSiteName: 'English practice.net',
      description:
          'Improve your English listening skills with a variety of B1 level listening exercises and tests',
    ),
    ListenModel(
      url: 'https://test-english.com/listening/b1/',
      webSiteName: 'Test english',
      description:
          'Enhance your B1 level listening proficiency through interactive listening exercises and practice tests',
    ),
    ListenModel(
      url: 'https://www.esl-lab.com/',
      webSiteName: 'Randall\'s Esl Cyber Listening lab',
      description:
          ' Improve your listening skills in English with a variety of audio lessons, quizzes, and exercises offered by Randall\'s ESL Cyber Listening Lab',
    ),
    ListenModel(
        url: 'https://www.englishcentral.com/browse/videos',
        description:
            'Learn English through a vast collection of video lessons, interactive exercises, and live tutoring sessions',
        webSiteName: 'English central'),
    ListenModel(
      url: 'https://www.bbc.co.uk/learningenglish/',
      webSiteName: 'BBC Learning English',
      description:
          ' Access a wide range of language learning materials, including courses, grammar lessons, vocabulary exercises, and more, provided by the BBC',
    ),
  ];
}
