import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/application/auth/sign_up_form/cubit/sign_up_form_cubit.dart';
import 'package:my_project/injections.dart';
import 'package:my_project/presentation/sign_up_form/body.dart';

class SignUpFormScreen extends StatelessWidget {
  const SignUpFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), resizeToAvoidBottomInset: false, body: BlocProvider<SignUpFormCubit>(create: (_) => getIt<SignUpFormCubit>(), child: Body()));
  }
}
