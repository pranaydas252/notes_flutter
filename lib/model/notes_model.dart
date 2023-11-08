// class Note{
//   int? id;
//   String? title;
//   String? description;
//
//   Note({
//     this.id = null,
//     this.title = "Note",
//     this.description = "Text"
//   });
//
//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> data = Map<String, dynamic>();
//     if(id != null) {
//       data['id'] = id;
//     }
//     data['title'] = title;
//     data['description'] = description;
//     return data;
//   }
//
//   @override toString() {
//     return {
//       'id' : id,
//       'title' : title,
//       'description': description,
//     }.toString();
//   }
// }