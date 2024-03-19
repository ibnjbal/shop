class TestPageModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;
  final String details;
  final int piastres;
  final String hotItem;
  final String hotItemText;
  final int priceBefore;
  final int stock;
  final String package;
  final String brand;
  final String brandLogo;

  TestPageModel ({required this.piastres, required this.hotItem, required this.hotItemText, required this.priceBefore, required this.stock, required this.package, required this.brand, required this.brandLogo, required this.id, required this.name, required this.price, required this.description, required this.image, required this.details});

  static TestPageModel fromJson(Map<String, dynamic> json) => TestPageModel(
      id: json['id'],
      name: json['name']??'',
      price: json['price'],
      description: json['description']??'',
      image: json['image']??'',
      details: json['details']??'',
      piastres: json['piastres'],
      hotItem: json['hot items'],
      hotItemText: json['hot item text'],
      priceBefore: json['price before'],
      stock: json['stock'],
      package: json['package'],
      brand: json['brand'],
      brandLogo: json['brand logo'],
  );
  Map<String, dynamic> toJson () => <String, dynamic>{
    'id' : id,
    'name' : name,
    'price' : price,
    'description' : description,
    'image' : image,
    'details' : details,

  };
}






/*
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_flutter;
import 'package:supabase_client/supabase_client.dart' as supabase_client;

final supb = SupabaseClient('https://pxtnkrysopeyonsgbybh.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4dG5rcnlzb3BleW9uc2dieWJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODgyMjE3MDMsImV4cCI6MjAwMzc5NzcwM30.85T3y9VKsgezuDKLK6FFoVkKENCeqFGkLjug6dybE_w');



// final client = supabase_client.Supabase.instance.client
//     .from('countries')
// // .select('name')
//     .select<List<Map<dynamic, dynamic>>>();

// Define a class model for album
class TestPageModel {
  final int id;
  final String name;
  final String details;
  final String description;
  final String image;
  final double price;

  // Constructor
  TestPageModel(this.id, this.name, this.details, this.image, this.price, this.description);

  // Convert a map to an album object
  factory TestPageModel.fromMap(Map<String, dynamic> map) {
    return TestPageModel(
      map['id'],
      map['name'],
      map['Details'],
      map['Image'],
      map['price'],
      map['description'],
    );
  }

  // Convert an album object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'image': image,
      'price': price,
      'description': description,
    };
  }
}

// Fetch data from supabase table and convert it to a list of albums
Future<List<TestPageModel>> fetchAlbums() async {
  // Query the table with 5 columns
  final response = await supb.from('countries').select();
  print("The response is Loaded:" +response.toString());

  // Handle errors
  if (response.status == 200) {
  }

  // Convert the data to a list of maps
  final data = response.data as List<Map<String, dynamic>>;

  // Convert each map to an album object
  final albums = data.map((map) => TestPageModel.fromMap(map)).toList();

  // Return the list of albums
  return albums;
}
*/