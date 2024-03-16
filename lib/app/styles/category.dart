class Category {
  String thumbnail;
  String name;

  Category({
    required this.name,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'OJEK ONLINE',
    thumbnail: 'assets/kategoriNew1.png',
  ),
  Category(
    name: 'MAKANAN',
    thumbnail:  'assets/kategoriNew2.png',
  ),
  Category(
    name: 'INFORMASI KOS',
    thumbnail: 'assets/kategoriNew3.png',
  ),
  Category(
    name: 'BARANG',
    thumbnail:'assets/kategoriNew4.png',
  ),
];