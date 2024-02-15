// ignore_for_file: public_member_api_docs, sort_constructors_first
List<MainCardsListMock> mainCardsListMock = [
  MainCardsListMock(title: 'Bistrô Saint German', subtitle: '50 meters away'),
  MainCardsListMock(title: 'Praça das Araras', subtitle: '10 meters away'),

];

List<String> smallCardsListMock = ['Leisure', 'Culture', 'Shopping', 'Sports'];

class MainCardsListMock {
  String title;
  String subtitle;

  MainCardsListMock({
    required this.title,
    required this.subtitle,
  });
}
