class CategoryModel {
  String? id;
  String? categoryname;
  String? images;

  CategoryModel(
      {this.id,
      this.categoryname,
      this.images});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryname = json['categoryname'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryname'] = this.categoryname;
    data['images'] = this.images;
    return data;
  }
}
