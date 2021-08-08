import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_project/application/auth/sign_in_form/cubit/sign_in_form_cubit.dart';
import 'package:my_project/presentation/core/actions.dart';
import 'package:my_project/presentation/core/rounded_button.dart';
import 'package:my_project/presentation/core/styled_text_form_field.dart';
import 'package:my_project/routes/routes.gr.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class Body extends HookWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDialogOpen = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    return BlocListener<SignInFormCubit, SignInFormState>(
        listener: (context, state) async {
          if (state.isLoading) {
            WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
            isDialogOpen.value = true;
            await showLoadingDialog(context).then((_) => isDialogOpen.value = false);
          } else if (isDialogOpen.value) {
            context.pop();
            state.authFailureOrSuccess!.fold((f) => showSnackBarError(context, message: f.message), (_) {
             context.router.replaceAll([TodosOverviewScreenRoute()]);
            });
          }
        },
        child: Form(
          key: formKey.value,
          autovalidateMode: context.watch<SignInFormCubit>().state.showErrors ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: <Widget>[
            "Sign In!".text.black.headline3(context).make(),
            HeightBox(60),
            StyledTextFormField(
            
              hintText: "Email",
              onChanged: context.read<SignInFormCubit>().emailChanged,
              validator: (_) => context.read<SignInFormCubit>().state.emailAddress.validation.fold((f) => f.message, (_) => null),
            ).px16().py12(),
            StyledTextFormField(
                hintText: "Password",
                onChanged: context.read<SignInFormCubit>().passwordChanged,
                obsecureText: true,
                validator: (_) => context.read<SignInFormCubit>().state.password.validation.fold((f) => f.message, (_) => null)).px16().py12(),
            HeightBox(60),
            RoundedButton(
              child: "Sign in".text.size(20).make(),
              onPressed: () {
                context.read<SignInFormCubit>().signInPressed();
                
              },
              color: Color(0xff4D5E81),
            ).w48(context).h(45).p8(),
            RoundedButton(
                child: "Not registered?".text.hexColor("#4D5E81").size(20).make(),
                color: Colors.white,
                borderColor: Color(0xff4D5E81),
                onPressed: () {
                  
                  context.router.push(SignUpFormScreenRoute()).then((_) => formKey.value.currentState?.reset());
                }).w48(context).h(45).p8(),
          ].column(alignment: MainAxisAlignment.spaceEvenly).scrollVertical().centered(),
        ));
  }
}
