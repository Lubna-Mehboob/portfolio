import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/screen_size.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());

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
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  //Call Function to jum to specific section on Mobile-------
                  scrollToSection(navIndex);
                  scaffoldKey.currentState?.closeEndDrawer();
                },
              ),
        backgroundColor: CustomColor.scaffoldBg,
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navBarKeys.first),

              //>>>>>>>MAIN----header-----Desktop-------Screen----
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    //Call Function to jum to specific section on Desktop-------
                    scrollToSection(navIndex);
                  },
                )
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
                //Header icon key to skill section------------
                key: navBarKeys[1],
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

                    //Platform and Skills--------Desktop----View--------------------

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

              //PROJECTS****--------********----------------------
              MyProjectSection(key: navBarKeys[2]),
              const SizedBox(
                height: 30,
              ),

              //CONTACT****--------********-------------
              ContactSection(
                key: navBarKeys[3],
              ),
              const SizedBox(height: 30),

              //FOOTER****--------********-------------
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      return;
    }

    final key = navBarKeys[navIndex];

    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      print('Widget with the given key is not in the widget tree.');
    }
  }
}
