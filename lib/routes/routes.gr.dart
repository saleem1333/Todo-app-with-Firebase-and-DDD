// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../presentation/sign_in_form/sign_in_form_screen.dart' as _i4;
import '../presentation/sign_up_form/sign_up_form_screen.dart' as _i5;
import '../presentation/splash/splash_screen.dart' as _i3;
import '../presentation/todos/todos_overview_screen.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreen();
        }),
    SignInFormScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SignInFormScreen();
        }),
    SignUpFormScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SignUpFormScreen();
        }),
    TodosOverviewScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.TodosOverviewScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i1.RouteConfig(SignInFormScreenRoute.name,
            path: '/sign-in-form-screen'),
        _i1.RouteConfig(SignUpFormScreenRoute.name,
            path: '/sign-up-form-screen'),
        _i1.RouteConfig(TodosOverviewScreenRoute.name,
            path: '/todos-overview-screen')
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

class SignInFormScreenRoute extends _i1.PageRouteInfo {
  const SignInFormScreenRoute() : super(name, path: '/sign-in-form-screen');

  static const String name = 'SignInFormScreenRoute';
}

class SignUpFormScreenRoute extends _i1.PageRouteInfo {
  const SignUpFormScreenRoute() : super(name, path: '/sign-up-form-screen');

  static const String name = 'SignUpFormScreenRoute';
}

class TodosOverviewScreenRoute extends _i1.PageRouteInfo {
  const TodosOverviewScreenRoute()
      : super(name, path: '/todos-overview-screen');

  static const String name = 'TodosOverviewScreenRoute';
}
