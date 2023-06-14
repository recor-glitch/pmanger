import 'package:flutter/material.dart';
import 'package:pmanager/presentation/components/BottomNavbar.dart';
import 'package:pmanager/presentation/home/projects/ProjectTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            TabBarView(
                controller: controller,
                children: [Container(), Container(), ProjectPage()]),
            Positioned(
                bottom: 0, child: BottomNavbar(tabController: controller))
          ],
        ),
      )),
    );
  }
}
