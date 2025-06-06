import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("नमस्ते! 👋", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text("आज आपका दिन कैसा रहा?", style: TextStyle(fontSize: 18)),
              SizedBox(height: 30),
              Text("सेवाएं", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildServiceCard("हमारे बारे में", Icons.favorite),
                  _buildServiceCard("सेतु से सलाह लें", Icons.medication_liquid),
                  _buildServiceCard("ऑडियो किताबें/कहानियाँ", Icons.menu_book),
                  _buildServiceCard("सामान्य मानसिक स्वास्थ्य समस्याएँ", Icons.psychology),
                ],
              ),
              SizedBox(height: 30),
              Text("आज का सुझाव", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration( 
                  gradient: LinearGradient(colors: [Colors.teal, Colors.green]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("गहरी सांस लें\n5 मिनट का अभ्यास तनाव कम करता है और मन को शांत रखता है।",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal,
                      ),
                      child: Text("अभी करें"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "होम"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "सलाह"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "किताबें"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "प्रोफ़ाइल"),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.teal),
              SizedBox(height: 10),
              Text(title, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
