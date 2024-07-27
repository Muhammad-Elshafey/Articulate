class ArticlesModel {
  final String articleName;
  final String authorName;
  final String url;
  final String webSite;

  ArticlesModel(
      {required this.articleName,
      required this.authorName,
      required this.url,
      required this.webSite});
  static List<ArticlesModel> articlesList = [
    ArticlesModel(
        articleName: 'The Importance of Pronunciation',
        authorName: 'CAMILLE TURNER',
        url:
            'https://www.fluentu.com/blog/english/importance-of-english-pronunciation/',
        webSite: 'FluentU'),
    ArticlesModel(
        articleName:
            'How to easily improve your English pronunciation and sound like a native',
        authorName: 'Nadiia Mykhalevych',
        url: 'https://preply.com/en/blog/improve-your-english-pronunciation/',
        webSite: 'Preply'),
    ArticlesModel(
        articleName: 'Free English Pronunciation Curriculum',
        authorName: 'eEnglish Team',
        url: 'https://englishlearning.com/english-pronunciation-curriculum',
        webSite: 'Englishlearning'),
    ArticlesModel(
        articleName: 'Pronunciation of English',
        authorName: 'Trager,',
        url:
            'https://en.wikipedia.org/wiki/Pronunciation_of_English_%E2%9F%A8a%E2%9F%A9',
        webSite: 'Wikipedia'),
    ArticlesModel(
        articleName: '10 tips for perfect English pronunciation',
        authorName: 'EF English Live Team',
        url:
            'https://englishlive.ef.com/en/blog/language-lab/10-tips-perfect-english-pronunciation/',
        webSite: 'Englishlive'),
    ArticlesModel(
        articleName: 'English Pronunciation Instruction: A Literature Review',
        authorName: 'Aliaga García',
        url: 'https://ijreeonline.com/article-1-21-en.html',
        webSite: 'ijreeonline'),
    ArticlesModel(
        articleName:
            'The Significance of Pronunciation in English Language Teaching',
        authorName: 'Alicia Martínez-Flor',
        url:
            'https://www.researchgate.net/publication/267722924_The_Significance_of_Pronunciation_in_English_Language_Teaching',
        webSite: 'researchgate'),
    ArticlesModel(
        articleName:
            'Pronunciation in the English language classroom is more than just listen and repeat',
        authorName: 'Mark Hancock ',
        url:
            'https://www.britishcouncil.org/voices-magazine/teaching-pronunciation-more-just-listen-and-repeat',
        webSite: 'britishcouncil'),
  ];
}
