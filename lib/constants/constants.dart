import 'package:get_storage/get_storage.dart';

// LocalHost backend URL
String localUrl = 'http://10.0.2.2:5000';
String baseUrl = 'https://reqres.in';

// Screen Default Padding
const double kDefaultPadding = 16.0;


// Error keyword
const String errorKeyword = "error";

// Global Box variable
final box = GetStorage();

// GridView Builder local data
List<String> arr = [
  "Popular Course",
  "Designing Course",
  "Trending Course",
  "Hot & New Course",
];
