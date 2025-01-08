```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('Request failed with status: ${response.statusCode}.', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException {
    // Handle SocketException
    print('Network error. Please check your internet connection.');
    return null;
  } on FormatException catch (e) {
    //Handle JSON format exceptions
    print('Invalid JSON format: $e');
    return null;
  } on HttpException catch (e) {
    print('HTTP error: ${e.message}');
    return null;
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow;
  }
}

class HttpException implements Exception {
  final String message;
  final Uri? uri;

  HttpException(this.message, {this.uri});

  @override
  String toString() => 'HttpException: $message${uri != null ? ' at $uri' : ''}';
}
```