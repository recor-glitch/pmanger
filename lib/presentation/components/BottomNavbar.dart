import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int activeIndex = 0;
  @override
  void initState() {
    widget.tabController.addListener(() {
      if (widget.tabController.indexIsChanging) {
        setState(() {
          activeIndex = widget.tabController.index;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            Color.fromRGBO(238, 76, 94, 0.7),
            Color.fromRGBO(221, 45, 127, 0.35),
            Color.fromRGBO(194, 14, 161, 0.02),
          ])),
      child: TabBar(
          indicator: const BoxDecoration(
            color: Colors.transparent,
          ),
          controller: widget.tabController,
          unselectedLabelColor: const Color.fromRGBO(153, 153, 153, 1),
          labelColor: const Color.fromRGBO(255, 255, 255, 1),
          tabs: [
            Tab(
              icon: const Icon(Icons.airline_stops_outlined),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.004,
                decoration: activeIndex == 0
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                            Color.fromRGBO(194, 14, 161, 0.02),
                            Color.fromRGBO(221, 45, 127, 0.35),
                            Color.fromRGBO(238, 76, 94, 0.7)
                          ]))
                    : const BoxDecoration(color: Colors.transparent),
              ),
            ),
            Tab(
              icon: const Icon(Icons.calendar_month_outlined),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.004,
                decoration: activeIndex == 1
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                            Color.fromRGBO(194, 14, 161, 0.02),
                            Color.fromRGBO(221, 45, 127, 0.35),
                            Color.fromRGBO(238, 76, 94, 0.7)
                          ]))
                    : const BoxDecoration(color: Colors.transparent),
              ),
            ),
            Tab(
              icon: const Icon(Icons.fact_check_outlined),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.004,
                decoration: activeIndex == 2
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                            Color.fromRGBO(194, 14, 161, 0.02),
                            Color.fromRGBO(221, 45, 127, 0.35),
                            Color.fromRGBO(238, 76, 94, 0.7)
                          ]))
                    : const BoxDecoration(color: Colors.transparent),
              ),
            )
          ]),
    );
  }
}
