import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/project_cards.dart';

class MyProjectSection extends StatelessWidget {
  const MyProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight2,
      child: Column(
        children: [
          //Work Project title--------
          const Text(
            'Work Projects',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          // Work Project Cards---------

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                //For loop to iterate over MyProject List----------
                for (int i = 0; i < myProjects.length; i++)
                  ProjectCards(
                    projectUtilities: myProjects[i],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          //Hobby Project title--------
          const Text(
            'Hobby Projects',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          // Hobby Project Cards---------

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                //For loop to iterate over hobbyProject List----------
                for (int i = 0; i < hobbyProjects.length; i++)
                  ProjectCards(
                    projectUtilities: hobbyProjects[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
