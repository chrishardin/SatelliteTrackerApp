import 'package:logging/logging.dart';
import 'package:flutter/material.dart';

final Logger logger = Logger('HomePage');

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _buildAppBar(),
      body: SingleChildScrollView(
        // Allows for a scrollable column
        child: Column(
          children: <Widget>[
            _buildSatelliteOfTheDay(),
            _buildCategorySection(),
            _buildContentCards(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Hello, User!'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button
            logger.info("TODO: Handle menu button");
          },
        ),
      ],
    );
  }

  Widget _buildSatelliteOfTheDay() {
    // Return a satellite of the day card widget
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Image.asset(
              'assets/sat.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Satellite Name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            // Add more overlays here
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
      // Changed from Container
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildCategoryItem(Icons.cloud, 'Weather'),
          _buildCategoryItem(Icons.star, 'Astronomy'),
          _buildCategoryItem(Icons.satellite, 'Spacecraft'),
          _buildCategoryItem(Icons.public, 'ISS'),
          // Add more categories here
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildContentCards() {
    return Column(
      children: <Widget>[
        _buildContentCard('Stunning Nebula Photography', '15 min',
            'assets/galaxy_thumbnail_placeholder3.png'),
        _buildContentCard(
            'Astronomy 101', '1h', 'assets/galaxy_thumbnail_placeholder2.png'),
        // Add more cards here
      ],
    );
  }

  Widget _buildContentCard(String title, String duration, String imageUrl) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: ListTile(
        // TODO: Swap from using file to network
        leading: Image.asset(imageUrl, width: 100, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(duration),
        trailing: const Icon(Icons.favorite_border),
        // Add onTap or other interactions here
      ),
    );
  }
}
