import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'caller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final httpp = HttpClientt;
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'http://127.0.0.1:8000/api/member/1/'));
  List<Map<String, dynamic>> mapp = [];

  var id = '';
  var address = '';
  var ty = '';
  var width = 0;
  interceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        debugPrint((e.statusMessage));
      },
    ));
  }

  void fetchdata() async {
    final response = await _dio.get('http://127.0.0.1:8000/api/member/2/');
    debugPrint(response.data['id'].toString());
    interceptors();
    setState(() {
      id = response.data['id'].toString();
      address = response.data['address'.toString()];
      ty = 'My ID is: $id and My Address is : $address';
      mapp.add(response.data);
      mapp.add({"id": "3", "name": "omoba"});
      width = MediaQuery.of(context).size.width.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(onPressed: fetchdata, child: const Text('iu')),
      LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: mapp
                    .map((data) => Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(233, 62, 53, 1),
                            borderRadius: BorderRadius.circular(10)),
                        width: (width * 0.7).toDouble(),
                        child: Text(
                            "${width.toString()} ${data['id'].toString()}")))
                    .toList()),
          );
        },
      ),
    ]));
  }
}
