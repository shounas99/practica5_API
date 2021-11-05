
class ComicsModel {
  int?       id;
  String?    title;
  int?       issueNumber;
  String?    variantDescription;
  String?    description;
  int?       pageCount;

  ComicsModel({
    this.id,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.pageCount
  });

  factory ComicsModel.fromMap(Map<String, dynamic> map){
    return ComicsModel(
      id          :map['id'],
      title       :map['title'],
      issueNumber :map['issueNumber'] ?? '',
      variantDescription :map['variantDescription'] ?? '',
      description :map['description'] ?? '',
      pageCount   :map['pageCount'] ?? ''
    );
  }
}