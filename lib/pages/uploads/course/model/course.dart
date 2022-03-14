
import 'dart:io';

class Course{
  final String usersid;
  final String courseTitle;
  final String courseType;
  final String price;
  final String? category;
  final String? description;
  final String? package;  
  final String? imageURL; 
  final   File? image;
  
  final String? created_time;
  final List<String> tags;  
  final List<String> videonames;
  final List<String> filenames;
  final List<String> subTitles;//they are 14

  const Course({
        required this.usersid,
        this.category,
        required this.courseTitle, 
        required this.courseType, 
        required this.price, 
        this.description, 
         this.package, 
        this.tags = const [],
        this.videonames = const [],
        this.filenames = const [],
        this.subTitles = const [],
        this.imageURL,
        this.image,
         this.created_time});
   
   static Course fromJson(Map<String, dynamic> json) => Course(
        usersid: json['usersid'],
        courseType: json['courseType'] ,
        courseTitle: json['courseTitle'],
        category :json['category'],
        price: json['price'] ,
        package: json['package'],
        imageURL: json['imageURL'] ,
        created_time: DateTime.parse(json['created'] as String) as String,
         videonames: json['videonames'],
         filenames: json['filenames'],
         subTitles: json['subTitles'],
           tags: json['tags'],
      );
      
       Map<String, dynamic> toJson()=>{
              'usersid' :usersid,
             'courseType': courseType,
             'courseTitle': courseTitle,
             'category': category,
             'description': description,
             'price': price,
             ' package': package,
             'tags': tags,
             ' imageURL': imageURL,
             'videonames':videonames,
             'filenames':filenames,
             'subTitles':subTitles,
             'created_time': DateTime.now().toString(),
            'TimeStamp':DateTime.now(),
     };
}