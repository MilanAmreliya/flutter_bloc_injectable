import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/cubit/api_cubit.dart';
import 'package:flutter_bloc_demo/inject/inject_file.dart';

var provider = [
  BlocProvider<GoogleApiCubit>(create: (_) => getIt<GoogleApiCubit>()),

  // BlocProvider<GoogleApiCubit>(
  //   create: (context) => GoogleApiCubit(),
  // )
];
