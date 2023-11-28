import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/cubit/api_cubit.dart';
import 'package:http/http.dart' as http;

class BlocDemoScreen extends StatefulWidget {
  const BlocDemoScreen({Key? key}) : super(key: key);

  @override
  State<BlocDemoScreen> createState() => _BlocDemoScreenState();
}

class _BlocDemoScreenState extends State<BlocDemoScreen> {
  GoogleApiCubit get cubit => BlocProvider.of<GoogleApiCubit>(context);
  tsak() async {
    print('idsgf6tsf6tywgfb');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMTllMjFmMC0wZmU2LTRhZWYtODMzZC0xNTUyOWI4N2E1ODEiLCJtb2JpbGVObyI6Ijk4MjQwMjIwMDkiLCJyb2xlIjoidXNlciIsImlhdCI6MTY4OTYwMzA5NiwiZXhwIjoxNjg5Njg5NDk2fQ.qkze51fnbB50Uhb1lTIWePtXLMrwL9RC8T0R4CF2oW4'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://ec2-13-127-52-162.ap-south-1.compute.amazonaws.com:5000/task/allTasks'));
    request.body = json.encode({"taskAssign": "AssignByMe"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('gtjfrtgjfgjnfgngfzn  ${await response.stream.bytesToString()}');
    } else {
      print("sfgrthrfhfrhgfthn  ${response.reasonPhrase}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tsak();
    // cubit.googleApiCall();
  }

  @override
  Widget build(BuildContext context) {
    print('call build');
    var cubitJ = BlocProvider.of<GoogleApiCubit>(context);

    return BlocBuilder<GoogleApiCubit, GoogleApiState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text(
                'bloc',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text(
                '${cubitJ.state.googleApiStatus}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            InkWell(
              child: Text('Is Tap ${cubitJ.state.isTap}'),
              onTap: () async {
                cubit.googleApiCall();
                cubit.setIStap();
              },
            )
          ]),
        );
      },
    );
  }
}
