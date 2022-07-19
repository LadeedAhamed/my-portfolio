//import 'dart:js';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_app/Widget/Cards/project_card.dart';
import 'package:portfolio_app/Widget/Header/header.dart';
import 'package:portfolio_app/example/projects.dart';
import 'package:portfolio_app/responsive.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(height: 25),
                  const Text(
                    'Projects',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // SizedBox(
                  //   height: 350,
                  //   child: ScrollConfiguration(
                  //     behavior: MyCustomScrollBehavior(),
                  //     child: ListView.builder(
                  //       itemBuilder: (context, index) {
                  //         return ProjectCard(project: projects[index]);
                  //       },
                  //       itemCount: projects.length,
                  //       scrollDirection: Axis.horizontal,
                  //     ),
                  //   ),
                  // ),
                  Responsive(
                      mobile: mobileTabletBuilder(350),
                      desktop: desktopBuilder(),
                      tablet: mobileTabletBuilder(450))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          // ignore: sort_child_properties_last
          child: const Icon(
            Icons.share,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          onPressed: () {
            Share.share(
                "Check out Jack's portfolio https://my-portfolio-8c1f9.web.app/#/");
          }),
    );
  }

  Widget mobileTabletBuilder(double height) {
    return SizedBox(
        height: height,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            }));
  }

  Widget desktopBuilder() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
