import 'package:flutter/material.dart';
import 'package:pmanager/presentation/home/homePage.dart';
import 'package:pmanager/presentation/home/newProject/AddProject.dart';
import 'package:pmanager/presentation/home/projectDetail/proejctDetail.dart';

class AutoRouter {
  Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case '/add':
        return MaterialPageRoute(
          builder: (context) => AddProjectTab(),
        );
      case '/detail':
        return MaterialPageRoute(
          builder: (context) => ProjectDetail(),
        );
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
