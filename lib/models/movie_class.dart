class MovieClass {
  final int id;
  String category;

  MovieClass({required this.id, required this.category});

  @override
  String toString() {
    // TODO: implement toString
    return "id : $id , category : $category\n";
  }
}