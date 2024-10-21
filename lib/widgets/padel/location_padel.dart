import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationPadel extends StatefulWidget {
  const LocationPadel({super.key});

  @override
  State<LocationPadel> createState() => _LocationPadelState();
}

class _LocationPadelState extends State<LocationPadel> {
  bool _isLoading = true;

  // Method to open Google Maps for navigation
  Future<void> _openMapForDirections(double latitude, double longitude) async {
    final Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude');

    if (await launchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch map for directions.';
    }
  }

  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double latitude = 33.583511;
    double longitude = 35.387466;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: _isLoading
                ? null
                : () async {
                    try {
                      await _openMapForDirections(latitude, longitude);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('An error occurred when opening the map!'),
                        ),
                      );
                    }
                  },
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: IgnorePointer(
                    child: Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(latitude, longitude),
                            initialZoom: 17,
                            interactionOptions: const InteractionOptions(
                              flags: 0,
                            ),
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(latitude, longitude),
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
                        if (_isLoading)
                          Container(
                            color: Colors.black45,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage(
                        'lib/assets/icons/route.webp',
                      ),
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Smash Padel Court",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
