import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/Constants/colors.dart';
import 'package:my_portfolio/Constants/screen_size.dart';
import 'package:my_portfolio/Constants/sns_links.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          const Text(
            'Get in Touch',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(builder: (context, Constraints) {
              if (Constraints.maxWidth >= kMedDesktopWidth) {
                return buildnameEmailFieldDesktop();
              }
              return buildnameEmailFieldMobile();
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: const CustomTextfield(
              hintText: 'Your message',
              maxLine: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //send Buttn------------
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Get in Touch'),
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(),
          ),

          //SNS icons Button Links-----------
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              //Github button----
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.github]);
                },
                child: Image.asset(
                  'lib/assets/icons/github.png',
                  width: 28,
                ),
              ),
              //Facebook button----
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: Image.asset(
                  'lib/assets/icons/facebook.png',
                  width: 25,
                ),
              ),
              //Linkedin button----
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedIn]);
                },
                child: Image.asset(
                  'lib/assets/icons/linkedin.png',
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildnameEmailFieldDesktop() {
    return const Row(
      children: [
        Flexible(
            child: CustomTextfield(
          hintText: 'Your Name',
        )),
        SizedBox(
          width: 15,
        ),
        Flexible(
            child: CustomTextfield(
          hintText: 'Your email',
        )),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return const Column(
      children: [
        Flexible(
            child: CustomTextfield(
          hintText: 'Your Name',
        )),
        SizedBox(
          height: 15,
        ),
        Flexible(
            child: CustomTextfield(
          hintText: 'Your email',
        )),
      ],
    );
  }
}
