import 'package:flutter/material.dart';
import 'package:machientest/model/productsModel.dart';
import 'package:machientest/model/subCategoryModel.dart';
import 'package:machientest/services/api_services.dart';

class ImageGridPage extends StatefulWidget {
  final String categoryId;

  ImageGridPage({Key? key, required this.categoryId}) : super(key: key);

  @override
  _ImageGridPageState createState() => _ImageGridPageState();
}

class _ImageGridPageState extends State<ImageGridPage> {
  final ApiService apiService = ApiService();
  late Future<List<SubCategory>> subCategory;

  @override
  void initState() {
    super.initState();
    subCategory = apiService.fetchSubCategoryImages(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategory Images'),
      ),
      body: FutureBuilder<List<SubCategory>>(
        future: subCategory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No images found'));
          }

          final SubList = snapshot.data!;
          print(SubList[0].imgUrlPath);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: SubList.length,
            itemBuilder: (context, index) {
              final imageUrl =
                  '${ApiService.baseUrl}${SubList[index].imgUrlPath}';
              return Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        SubList[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
