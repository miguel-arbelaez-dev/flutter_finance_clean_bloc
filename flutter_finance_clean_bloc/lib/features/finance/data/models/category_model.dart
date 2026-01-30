class CategoryModel {
  static Category fromMap(Map data) {
    return Category(
      id: data['id'],
      name: data['name'],
    );
  }
}