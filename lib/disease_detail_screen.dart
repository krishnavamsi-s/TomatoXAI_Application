import 'package:flutter/material.dart';

class DiseaseDetailScreen extends StatelessWidget {
  final String diseaseName;

  DiseaseDetailScreen({required this.diseaseName}); // ✅ removed const

  // ✅ use final (NOT const)
  final Map<String, Map<String, List<String>>> diseaseData = {

    "Bacterial_spot": {
      "symptoms": [
        "Small dark brown or black spots on leaves",
        "Spots may have yellow halos",
        "Leaves turn yellow and drop"
      ],
      "cure": [
        "Spray copper-based bactericides",
        "Remove infected leaves",
        "Crop rotation"
      ],
      "precautions": [
        "Use disease-free seeds",
        "Avoid overhead watering",
        "Ensure good air circulation"
      ]
    },

    "Early_blight": {
      "symptoms": [
        "Brown spots with concentric rings (target-like)",
        "Starts from lower leaves",
        "Leaves turn yellow and fall"
      ],
      "cure": [
        "Fungicides like mancozeb or chlorothalonil",
        "Remove infected leaves early"
      ],
      "precautions": [
        "Maintain spacing between plants",
        "Mulching to avoid soil splash",
        "Avoid wet leaves"
      ]
    },

    "healthy": {
      "symptoms": [
        "Green, firm leaves",
        "No spots, discoloration, or curling"
      ],
      "cure": [
        "Not applicable"
      ],
      "precautions": [
        "Balanced fertilization",
        "Proper watering",
        "Regular monitoring"
      ]
    },

    "Late_blight": {
      "symptoms": [
        "Large dark brown or black patches",
        "White fuzzy growth on underside in humid conditions",
        "Rapid plant decay"
      ],
      "cure": [
        "Fungicides like metalaxyl or mancozeb",
        "Remove infected plants immediately"
      ],
      "precautions": [
        "Avoid high humidity",
        "Ensure good airflow",
        "Use resistant varieties"
      ]
    },

    "Leaf_Mold": {
      "symptoms": [
        "Yellow spots on upper leaf surface",
        "Olive-green or brown mold underneath",
        "Leaves curl and die"
      ],
      "cure": [
        "Fungicides like chlorothalonil or copper-based sprays",
        "Remove infected leaves"
      ],
      "precautions": [
        "Reduce humidity",
        "Improve ventilation",
        "Avoid overcrowding"
      ]
    },

    "Septoria_leaf_spot": {
      "symptoms": [
        "Small circular spots with gray centers",
        "Tiny black dots inside spots",
        "Lower leaves affected first"
      ],
      "cure": [
        "Fungicides like mancozeb",
        "Remove infected leaves"
      ],
      "precautions": [
        "Avoid water splashing",
        "Crop rotation",
        "Clean plant debris"
      ]
    },

    "Spider_mites Two-spotted_spider_mite": {
      "symptoms": [
        "Tiny yellow or white speckles on leaves",
        "Fine webbing on plant",
        "Leaves dry and fall"
      ],
      "cure": [
        "Spray water to remove mites",
        "Use neem oil or insecticidal soap",
        "Apply miticides if severe"
      ],
      "precautions": [
        "Maintain humidity",
        "Regular inspection",
        "Avoid dry conditions"
      ]
    },

    "Target_Spot": {
      "symptoms": [
        "Brown spots with concentric rings",
        "Leaves may drop",
        "Affects fruits as well"
      ],
      "cure": [
        "Fungicides like azoxystrobin or chlorothalonil",
        "Remove infected parts"
      ],
      "precautions": [
        "Avoid overhead irrigation",
        "Maintain plant spacing",
        "Ensure airflow"
      ]
    },

    "Tomato_mosaic_virus": {
      "symptoms": [
        "Light and dark green mosaic pattern",
        "Leaves become narrow and wrinkled",
        "Stunted growth"
      ],
      "cure": [
        "No cure available",
        "Remove infected plants immediately"
      ],
      "precautions": [
        "Avoid tobacco contact",
        "Use resistant varieties",
        "Disinfect tools"
      ]
    },

    "Yellow_Leaf_Curl_Virus": {
      "symptoms": [
        "Leaves curl upward",
        "Yellowing of leaves",
        "Stunted plant growth"
      ],
      "cure": [
        "No direct cure",
        "Remove infected plants",
        "Control whiteflies"
      ],
      "precautions": [
        "Use insect nets",
        "Control whiteflies",
        "Grow resistant varieties"
      ]
    }
  };

  @override
  Widget build(BuildContext context) {

    final data = diseaseData[diseaseName];

    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC5E8B7), Color(0xFFD0ECC5)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              sectionTitle("🦠 Symptoms"),
              bulletBox(data?["symptoms"] ?? []),

              sectionTitle("💊 Cure"),
              bulletBox(data?["cure"] ?? []),

              sectionTitle("⚠️ Precautions"),
              bulletBox(data?["precautions"] ?? []),

            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget bulletBox(List<String> items) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("• ", style: TextStyle(fontSize: 18)),
                Expanded(child: Text(item)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}