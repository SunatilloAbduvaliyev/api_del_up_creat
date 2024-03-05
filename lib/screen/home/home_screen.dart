import 'package:api_del_up_creat/data/model/my_response.dart';
import 'package:flutter/material.dart';

import '../../data/model/car_model/cars_model.dart';
import '../../data/repositories/car_model_repositories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarRepositories carRepositories = CarRepositories();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<MyResponse>(
        future: carRepositories.getAllCarProducts(),
        builder: (
          BuildContext builder,
          snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {

            List<dynamic> carData =
                (snapshot.data as MyResponse).data as List<dynamic>;
            CarsModel carModel = carData[0];
            return Center(
              child: Text(
                carModel.description
              )
            );
            //return Center(child: TextButton(onPressed: () async { await carRepositories.getAllCarProducts(); }, child: Text('data'),));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
