import 'package:flutter/material.dart';
import 'package:machientest/model/productsModel.dart';
import 'package:machientest/services/api_services.dart';
import 'package:machientest/views/subCategoryPage.dart';

class ImageCardScreen extends StatefulWidget {
  @override
  _ImageCardScreenState createState() => _ImageCardScreenState();
}

class _ImageCardScreenState extends State<ImageCardScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Products>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = apiService.fetchTemplateCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product category'),
      ),
      body: FutureBuilder<List<Products>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final imgUrlPath = category.imgUrlPath;
              final imageUrl = '${ApiService.baseUrl}$imgUrlPath';
              final name = category.name;

              return GestureDetector(
                onTap: () {
                  // ImageGridPage
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ImageGridPage(categoryId: category.id);
                    },
                  ));
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.network(imageUrl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(name, style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
