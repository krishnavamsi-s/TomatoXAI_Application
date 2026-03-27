import 'package:flutter/material.dart';
import 'disease_detail_screen.dart';

class DiseaseListScreen extends StatelessWidget {
  final List<String> diseases = [
    "Bacterial_spot",
    "Early_blight",
    "healthy",
    "Late_blight",
    "Leaf_Mold",
    "Septoria_leaf_spot",
    "Spider_mites Two-spotted_spider_mite",
    "Target_Spot",
    "Tomato_mosaic_virus",
    "Yellow_Leaf_Curl_Virus"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFC5E8B7), Color(0xFFD0ECC5)],
        ),
      ),
      child: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(diseases[index]),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DiseaseDetailScreen(diseaseName: diseases[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}