import 'package:flutter/material.dart';
import 'about_page.dart'; // Import the About Page
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.account_circle, size: 30),
          onPressed: () {
            // Navigate to Profile Page (Optional)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(username: username)),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showAddDeviceDialog(context); // Show the add device dialog
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Clickable box with local image for "Baseus Intelligence Quality Life"
            GestureDetector(
              onTap: () {
                // Navigate to Product Info Page when the box is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()), // Replace with actual page
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9, // Adjust to the correct aspect ratio for your image
                  child: Stack(
                    children: [
                      // Image filling the container with aspect ratio
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/baseus_info.jpg', // Replace with your local image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Text on top of the image
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'About : Baseus Intelligence Quality Life',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Change text color for visibility
                          ),
                        ),
                      ),
                      // Arrow icon at the bottom right corner
                      Align(
                        alignment: Alignment.bottomRight,
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // My Device title
            const Text(
              'My Device',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Grid of devices
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 16, // Space between columns
                mainAxisSpacing: 16, // Space between rows
                children: [
                  _buildDeviceCard(context, 'Bowie E16', 'assets/bowiee16.png', 80, 75),
                  _buildDeviceCard(context, 'Bowie M10 Pro', 'assets/bowiee3.jpg', 60, 60),
                  _buildDeviceCard(context, 'Bowie WM01', 'assets/bowiewm01.jpg', 100, 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a device card with a clickable popup
  Widget _buildDeviceCard(BuildContext context, String deviceName, String imagePath, int leftBattery, int rightBattery) {
    return GestureDetector(
      onTap: () {
        _showDeviceDetails(context, deviceName, imagePath, leftBattery, rightBattery);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 80, errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.broken_image, size: 80, color: Colors.grey);
            }),
            const SizedBox(height: 8),
            Text(deviceName),
          ],
        ),
      ),
    );
  }

  // Function to show the dialog with device details and battery percentages
  void _showDeviceDetails(BuildContext context, String deviceName, String imagePath, int leftBattery, int rightBattery) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(deviceName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath, height: 100), // Show device image
              const SizedBox(height: 16),
              
              // Battery percentages for left and right earbud
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('L', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('$leftBattery%'),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('R', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('$rightBattery%'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to show the Add Device dialog (similar to your image)
  void _showAddDeviceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Device"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text('Add manually'),
                onTap: () {
                  // Action for adding device manually
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/logo.png'), // Logo placeholder
                    ),
                    SizedBox(height: 16),
                    Text('Searching for devices...'),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
