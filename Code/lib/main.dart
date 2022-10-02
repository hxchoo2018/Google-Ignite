import 'package:ecomm_app/bloc/cart_bloc.dart';
import 'package:ecomm_app/product_listing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'map.dart';
import 'route_generator.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Location of Nearby Stores',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MapPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
