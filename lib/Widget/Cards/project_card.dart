import 'package:flutter/material.dart';
import 'package:portfolio_app/Models/project.dart';
import 'package:portfolio_app/project/project_detail.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  // final String projectName;
  // final int projectYear;
  // final String projectImage;
  // final String projectDescription;
  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_) => ProjectDetail(project: project,))),
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(top: 15,right: 25,bottom: 25),
        height: 350,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(5, 15),
              color: Colors.black.withOpacity(.15),
              blurRadius: 15)
        ],color: Colors.white, borderRadius: BorderRadius.circular(15) ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  project.name,
                  style: const TextStyle(fontSize: 18 ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  child: Text(
                    project.year.toString(),
                    style:const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Hero(
                tag: project.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    project.imageUrl,
                    fit: BoxFit.cover,
                    width: 500,
                  ),
                ),
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Text(
                project.description)
          ],
        ),
      ),
    );
  }
}