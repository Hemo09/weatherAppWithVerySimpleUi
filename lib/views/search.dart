import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app3/cubit/weatherCubit.dart';
import 'package:weather_app3/models/weatherModel.dart';
import 'package:weather_app3/weatherServices.dart';
class SearchView extends StatelessWidget {
TextEditingController? searchController;
var validate= GlobalKey<FormState>();
   SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: validate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextFormField(
                    controller:searchController ,
                    onFieldSubmitted: (value)async{
                      if(validate.currentState!.validate())
                      {
                        var cubit = BlocProvider.of<WeatherCubit>(context);
                        cubit.getData(cityName: value);
                       Navigator.pop(context);

                      }
                    },
                    validator: (String? value)
                    {
                      if(value!.isEmpty)
                      {
                        return "Search must not be empty";
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.00)
                      ),
                      label:const  Text("Search"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
WeatherModel? weatherModel;