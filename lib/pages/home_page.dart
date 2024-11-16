import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/screen_size.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
//import 'package:my_portfolio/Constants/skill_items.dart';
//import 'package:my_portfolio/utils/project_utils.dart';
//import 'package:my_portfolio/Constants/navbar_items.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
//import 'package:my_portfolio/styles/style.dart';
//import 'package:my_portfolio/Constants/navbar_items.dart';

import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
//import 'package:my_portfolio/widgets/project_cards.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
//import 'package:my_portfolio/widgets/skills_desktop.dart';
//import 'package:my_portfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size; //>>>>>>>Variables>>>>>>------
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        //If Condition for Drawer--------to show on Mobile but not on Desktop-----------
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : const DrawerMobile(),
        backgroundColor: CustomColor.scaffoldBg,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            if (constraints.maxWidth >= kMinDesktopWidth)
              //>>>>>>>MAIN----header-----Desktop-------Screen----
              const HeaderDesktop()
            else

              //>>>>>>>MAIN----header-----Mobile-----Screen------
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            //>>>>>>>MAIN----Screen-----Desktop-----View---------

            const MainDesktop(),

            //SKILLS----------------------------
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: CustomColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Title-------
                  const Text(
                    'What can I do',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //Platform and Skills--------Desktop----View-------------
                  //SkillsMobile(),
                  if (constraints.maxWidth >= kMedDesktopWidth)
                    const SkillsDesktop()
                  else
                    const SkillsMobile(),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //PROJECTS****--------********-------------
            const MyProjectSection(),
            const SizedBox(
              height: 30,
            ),

            //CONTACT****--------********-------------
            const ContactSection(),
            const SizedBox(height: 30),

            //FOOTER****--------********-------------
            const Footer(),
          ],
        ),
      );
    });
  }
}
