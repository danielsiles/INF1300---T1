class Element {
    final int userId;
    final int id;
    final String title;
    final String body;

    Element({this.userId, this.id, this.title, this.body});

    factory Element.fromJson(Map<String, dynamic> json) {
        return Element(
            userId: json['userId'],
            id: json['id'],
            title: json['title'],
            body: json['body'],
        );
    }
}