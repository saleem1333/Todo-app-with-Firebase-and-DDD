import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_project/application/auth/sign_up_form/cubit/sign_up_form_cubit.dart';
import 'package:my_project/presentation/core/actions.dart';
import 'package:my_project/presentation/core/rounded_button.dart';
import 'package:my_project/presentation/core/styled_text_form_field.dart';
import 'package:my_project/routes/routes.gr.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:auto_route/auto_route.dart';

class Body extends HookWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDialogOpen = useState(false);
    return BlocListener<SignUpFormCubit, SignUpFormState>(
        listener: (context, state) {
          if (state.isLoading && !isDialogOpen.value) {
            WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
            isDialogOpen.value = true;
            showLoadingDialog(context).then((_) => isDialogOpen.value = false);
          } else if (isDialogOpen.value) {
            state.authFailureOrSuccess?.fold((f) => showSnackBarError(context, message: f.message), (_) {
              context.router.popUntilRoot();
              return context.router.push(TodosOverviewScreenRoute());
            });
          }
        },
        child: Form(
          autovalidateMode: context.watch<SignUpFormCubit>().state.showErrors ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: <Widget>[
            "Sign up!".text.black.headline3(context).make(),
            HeightBox(60),
            StyledTextFormField(
              hintText: "Email",
              onChanged: context.read<SignUpFormCubit>().emailChanged,
              validator: (_) => context.read<SignUpFormCubit>().state.emailAddress.validation.fold((f) => f.message, (_) => null),
            ).px16(),
            StyledTextFormField(
              hintText: "Password",
              obsecureText: true,
              onChanged: context.read<SignUpFormCubit>().passwordChanged,
              validator: (_) => context.read<SignUpFormCubit>().state.password.validation.fold((f) => f.message, (_) => null),
            ).px16().py12(),
            StyledTextFormField(
              hintText: "Password Confirmation",
              obsecureText: true,
              onChanged: context.read<SignUpFormCubit>().passwordConfirmationChanged,
              validator: (_) => context.read<SignUpFormCubit>().state.passwordConfirmation.validation.fold((f) => f.message, (_) => null),
            ).px16(),
            HeightBox(60),
            RoundedButton(
              child: "Create".text.size(20).make(),
              onPressed: () {
                context.read<SignUpFormCubit>().registerPressed();
              },
              color: Color(0xff4D5E81),
            ).w48(context).h(45).p8(),
          ].column(alignment: MainAxisAlignment.spaceEvenly).scrollVertical().centered(),
        ));
  }
}
