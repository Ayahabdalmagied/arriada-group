import 'package:arriada_group/helpers/constants.dart';
import 'package:arriada_group/widgets/static_widgets/clickacble_text_widget.dart';
import 'package:arriada_group/widgets/static_widgets/intro_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../screens/auth_screens/login_screen.dart';
import 'static_widgets/main_button_widget.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'intro_screen';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      IntroCard(
        image: 'assets/onpordingone.png',
        title: AppLocalizations.of(context)!.introne,
      ),
      IntroCard(
        image: 'assets/play.png',
        title: AppLocalizations.of(context)!.introtwo,
      ),
      IntroCard(
        image: 'assets/remot.png',
        title: AppLocalizations.of(context)!.introthree,
      ),
    ];
    Size size = MediaQuery.of(context).size;
    // final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("$currentIndex/3"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClickableText(
                  text: AppLocalizations.of(context)!.skip,
                  // color: darkGreyColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen()));
                  }),
            ),
          )
        ],
      ),
      body: IntroductionScreen(
        showSkipButton: false,
        showBackButton: false,
        showDoneButton: false,
        showNextButton: false,
        dotsDecorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          activeColor: mainColor,
          color: mainColor.withOpacity(0.5),
          //themeListener.isDark ? lightWihteColor : mainColor,
          // color: themeListener.isDark
          //     ? lightWihteColor.withOpacity(0.5)
          //     : mainColor.withOpacity(0.5),
        ),
        globalBackgroundColor:
            //  themeListener.isDark ? darkGreyColor : lightWihteColor,
            Colors.white,
        rawPages: pages,
        onChange: (index) {
          setState(() {
            currentIndex = index + 1;
          });
        },
        curve: Curves.easeIn,
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.20,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainButton(
                // btnColor: currentIndex != 3 ? Colors.transparent : mainColor,
                txtColor: Colors.white,
                //     currentIndex != 3 ? Colors.transparent : darkGreyColor,
                radius: 30,
                text: currentIndex == 3
                    ? AppLocalizations.of(context)!.signin
                    : AppLocalizations.of(context)!.ccontinue,
                widthFromScreen: 0.5,
                onPressed: () {
                  if (currentIndex == 3) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
