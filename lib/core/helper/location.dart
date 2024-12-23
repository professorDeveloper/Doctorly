import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

Future<Map<String, String>> getCurrentLocationDetails() async {
  try {
    // Get the current location using Geolocator
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Google Geocoding API URL
    String apiKey =
        "AIzaSyDlyelUlpPGiEtnNjZmTi002Ce0ezXyVi8"; // Replace with your actual Google API key
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey';

    // Fetch the data from Google Geocoding API
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      if (data['results'].isNotEmpty) {
        var addressComponents = data['results'][0]['address_components'];
        var formattedAddress = data['results'][0]['formatted_address'];

        // Extract city (locality), district (tuman), and street (ko‘cha)
        String city = '';
        String district = '';
        String street = '';

        for (var component in addressComponents) {
          if (component['types'].contains('locality')) {
            city = component['long_name'];
          }
          if (component['types'].contains('sublocality_level_1') ||
              component['types'].contains('administrative_area_level_2')) {
            district = component['long_name'];
          }
          if (component['types'].contains('route')) {
            street = component['long_name'];
          }
        }

        return {
          'city': city.isNotEmpty ? city : 'City not found',
          'district': district.isNotEmpty ? district : 'District not found',
          'address': formattedAddress,
          'street': street.isNotEmpty ? street : 'Street not found',
        };
      } else {
        throw Exception('No address found for the current location.');
      }
    } else {
      throw Exception('Failed to fetch location details from Google Maps.');
    }
  } catch (e) {
    throw Exception('Error fetching location details: $e');
  }
}

