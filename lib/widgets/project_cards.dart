import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCards extends StatelessWidget {
  const ProjectCards({
    super.key,
    required this.projectUtilities,
  });
  final ProjectUtils projectUtilities;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //project Image
          Image.asset(
            projectUtilities.image,
            height: 120,
            width: 250,
            fit: BoxFit.cover,
          ),
          //Project Title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              projectUtilities.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          //Project SubTitle
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              projectUtilities.subtitle,
              style: const TextStyle(
                fontSize: 10,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          //Footer on Work Projects
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              children: [
                const Text(
                  'Available on',
                  style: TextStyle(
                      color: CustomColor.yellowSecondary, fontSize: 10),
                ),
                const Spacer(),
                //if(projectUtilities.webLink!=null)
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [projectUtilities.webLink]);
                  },
                  child: Image.asset(
                    'lib/assets/icons/web_icon.png',
                    width: 17,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
