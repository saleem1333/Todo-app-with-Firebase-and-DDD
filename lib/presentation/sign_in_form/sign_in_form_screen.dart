import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/application/auth/sign_in_form/cubit/sign_in_form_cubit.dart';
import 'package:my_project/presentation/sign_in_form/body.dart';

import '../../injections.dart';

class SignInFormScreen extends StatelessWidget {
  const SignInFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: BlocProvider<SignInFormCubit>(create: (_) => getIt<SignInFormCubit>(), child: Body()));
  }
}
