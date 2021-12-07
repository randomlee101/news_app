class Source
{
  String? id, name;

  Source();

  Source.fromJson(Map<String, dynamic> json)
  {
    this.id = json["id"];
    this.name = json["name"];
  }
}