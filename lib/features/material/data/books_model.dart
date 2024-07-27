class BooksModel {
  final String bookName;
  final String authorName;
  final String isFree;
  final String url;
  BooksModel(
      {required this.bookName,
      required this.authorName,
      required this.isFree,
      required this.url});

  static List<BooksModel> booksList = [
    BooksModel(
      bookName: 'an elementary pronunciation course',
      authorName: 'Baker, Ann',
      isFree: 'Free',
      url: 'https://archive.org/details/treeorthreeeleme02edbake',
    ),
    BooksModel(
      bookName: 'American accent training',
      authorName: 'Cook, Ann',
      isFree: 'Free',
      url: 'https://archive.org/details/americanaccenttr0000cook',
    ),
    BooksModel(
      bookName: 'An intermediate pronunciation course',
      authorName: ' Baker, Ann',
      isFree: 'Free',
      url: 'https://archive.org/details/shiporsheepinter0000bake',
    ),
    BooksModel(
      bookName: 'Perfecting your English pronunciation',
      authorName: ' Cameron, Susan',
      isFree: 'Free',
      url: 'https://archive.org/details/perfectingyouren0000came',
    ),
    BooksModel(
      bookName: 'a poem-based course for English pronunciation',
      authorName: 'Vaughan-Rees, Michael',
      isFree: 'Free',
      url: 'https://archive.org/details/rhymesrhythmpoem0000vaug',
    ),
    BooksModel(
      bookName: 'Pronunciation practice activities ',
      authorName: 'Hewings, Martin',
      isFree: 'Free',
      url: 'https://archive.org/details/pronunciationpra0000hewi',
    ),
    BooksModel(
      bookName: 'Pronunciation ',
      authorName: 'Dalton-Puffer, Christiane',
      isFree: 'Free',
      url: 'https://archive.org/details/pronunciation0000dalt',
    ),
    BooksModel(
      bookName: 'Pronunciation strategies',
      authorName: 'Gail Murphy Sonbucher',
      isFree: 'Free',
      url: 'https://archive.org/details/pronunciationstr0000unse',
    ),
    BooksModel(
      bookName: 'English pronunciation practice',
      authorName: 'Arnold, G. F. (George Frederick)',
      isFree: 'Free',
      url: 'https://archive.org/details/englishpronuncia0000arno',
    ),
    BooksModel(
      bookName: 'Pronunciation in action',
      authorName: 'Taylor, Linda (Linda L.)',
      isFree: 'Free',
      url: 'https://archive.org/details/pronunciationina0000tayl',
    ),
    BooksModel(
      bookName: 'The Black Book of Speaking Fluent English',
      authorName: 'Christopher Hill ',
      isFree: 'Paid',
      url: 'https://a.co/d/czSVE9n',
    ),
    BooksModel(
      bookName: 'Talk English: The Secret To Speak English Like A Native',
      authorName: ' Ken Xiao',
      isFree: 'Paid',
      url: 'https://a.co/d/4OrvxEG',
    ),
    BooksModel(
      bookName: 'ENGLISH: FAST TRACK LEARNING FOR PORTUGUESE SPEAKERS',
      authorName: 'Sarah Retter ',
      isFree: 'Paid',
      url: 'https://a.co/d/0ewH253',
    ),
    BooksModel(
      bookName: 'How to Speak Fluent English in 30 Days',
      authorName: 'k d',
      isFree: 'Paid',
      url: 'https://a.co/d/hjPSPr8',
    ),
    BooksModel(
      bookName: 'English Pronunciation Made Simple',
      authorName: ' Paulette Dale , Lillian Poms',
      isFree: 'Paid',
      url: 'https://a.co/d/amPr38V',
    ),
    BooksModel(
      bookName:
          'English Pronunciation in Use Elementary Book with Answers and Downloadable Audio',
      authorName: 'Jonathan Marks',
      isFree: 'Paid',
      url: 'https://a.co/d/5blMd7O',
    ),
  ];
}
