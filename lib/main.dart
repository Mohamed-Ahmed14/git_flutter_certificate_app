

import 'package:certificate_app/view/screens/certificate_calculate/certificate_home.dart';
import 'package:certificate_app/view_model/cubit/certificate_cubit/certificate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CertificateCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: CertificateHome(),
      ),
    ),
    );
}