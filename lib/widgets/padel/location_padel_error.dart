import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smash/widgets/sign_up/custom_snackbar.dart';

class LocationPadel extends StatefulWidget {
  const LocationPadel({super.key});

  @override
  State<LocationPadel> createState() => _LocationPadelState();
}

class _LocationPadelState extends State<LocationPadel> {
  // Method to request location permission
  Future<bool> _requestLocationPermission() async {
    // Check if location permission is granted
    if (await Permission.location.isGranted) {
      return true;
    } else {
      // Request permission if not granted
      var status = await Permission.location.request();
      if (status.isGranted) {
        return true;
      } else if (status.isDenied) {
        _showCustomSnackBar(
          'Location permission is denied. Please enable it in app settings.',
          context,
          true,
        );
      } else if (status.isPermanentlyDenied) {
        _showCustomSnackBar(
          'Location permission is permanently denied. Please open settings to allow permission.',
          context,
          true,
        );
        // Open app settings to allow user to manually enable the permission
        await openAppSettings();
      }
      return false;
    }
  }

  // Method to open Google Maps for navigation
  Future<void> _openMapForDirections(double latitude, double longitude) async {
    final Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude');

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch map for directions.';
    }
  }

  // Method to handle phone call
  Future<void> _launchPhoneCall() async {
    // Uncomment and implement phone call functionality here if needed
    // final Uri phoneUri = Uri(scheme: 'tel', path: '+123456789');
    // if (await canLaunchUrl(phoneUri)) {
    //   await launchUrl(phoneUri);
    // } else {
    //   throw 'Could not launch phone call.';
    // }
  }

  // Method to handle email
  Future<void> _launchEmail() async {
    // Uncomment and implement email functionality here if needed
    // final Uri emailUri = Uri(
    //   scheme: 'mailto',
    //   path: 'example@example.com',
    //   query: 'subject=PADEL Inquiry',
    // );
    // if (await canLaunchUrl(emailUri)) {
    //   await launchUrl(emailUri);
    // } else {
    //   throw 'Could not send email.';
    // }
  }

  void _showCustomSnackBar(String message, BuildContext context, bool isError) {
    final overlay = OverlayEntry(builder: (context) {
      return Positioned(
        top: MediaQuery.of(context).padding.top,
        left: 0,
        right: 0,
        child: FadeInSnackbar(
          message: message,
          isError: isError,
        ),
      );
    });
    Overlay.of(context).insert(overlay);

    Future.delayed(const Duration(seconds: 3), () {
      overlay.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    double latitude = 33.583511;
    double longitude = 35.387466;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
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
          // The map container with dynamic height using Flexible
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Flexible(
              flex: 3,
              child: GestureDetector(
                onTap: () async {
                  try {
                    // Check for location permission before opening map
                    bool permissionGranted = await _requestLocationPermission();
                    if (permissionGranted) {
                      await _openMapForDirections(latitude, longitude);
                    } else {
                      _showCustomSnackBar(
                        'Location permission is required to open the map.',
                        context,
                        true,
                      );
                    }
                  } catch (e) {
                    _showCustomSnackBar(
                      "An error occured when opening maps",
                      context,
                      true,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: IgnorePointer(
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(latitude, longitude),
                          initialZoom: 15,
                          interactionOptions: const InteractionOptions(
                            flags: 0, // Disables map interactions (optional)
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
                    ),
                  ),
                ),
              ),
            ),
          ),
          // The title and actions row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      onPressed: _launchPhoneCall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
