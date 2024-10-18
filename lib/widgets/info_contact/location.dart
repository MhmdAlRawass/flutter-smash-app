import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // For LatLng class
import 'package:url_launcher/url_launcher.dart'; // For launching Google Maps

class Location extends StatelessWidget {
  const Location({super.key});

  // Method to open Google Maps for navigation
  Future<void> _openMapForDirections(double latitude, double longitude) async {
    final Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude');

    if (await canLaunch(googleMapsUrl.toString())) {
      await launch(googleMapsUrl.toString());
    } else {
      throw 'Could not launch map for directions.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // Container for the map with styling
        GestureDetector(
      onTap: () {
        _openMapForDirections(33.5630, 35.3688); // Call method to open maps
      },
      child: Container(
        height: 250, // Fix the height to avoid infinite size
        width: double.infinity, // Make the width fill the parent
        margin:
            const EdgeInsets.all(16.0), // Add some margin around the container
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(20), // Modern rounded corners
          boxShadow: const [
            BoxShadow(
              color: Colors.black12, // Shadow color
              offset: Offset(0, 4), // Shadow position
              blurRadius: 8, // How much the shadow blurs
            ),
          ],
        ),
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(33.5630, 35.3688), // Saida, Lebanon
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            const MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(33.5630, 35.3688),
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),

        // "Take me to location" button
      ),
    );
  }
}
