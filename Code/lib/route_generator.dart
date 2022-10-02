import 'package:flutter/material.dart';
import 'map.dart';
import 'product_listing_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/FirstScreen':
        return MaterialPageRoute(builder: (_) => MapPage());
        case '/SecondScreen':
      // Validation of correct data type
          return MaterialPageRoute(
            builder: (_) => ProductListingWidget(
              //listPlayerNames: args,
            ),
          );
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
