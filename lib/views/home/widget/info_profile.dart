import 'package:flutter/material.dart';
import 'package:flutterlpsetest/provider/splash_provider.dart';
import 'package:flutterlpsetest/utils/images.dart';
import 'package:provider/provider.dart';

import '../../../provider/login_provider.dart';
import '../../../utils/color_resources.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.width / 3,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorResources.getPrimary(context),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        width: 60,
                        height: 60,
                        fit: BoxFit.fill,
                        image:
                            '${Provider.of<SplashProvider>(context, listen: false).baseUrls!.profileImageUrl}/${Provider.of<LoginProvider>(context, listen: false).getFoto().toString()}',
                        imageErrorBuilder: (c, o, s) => Image.asset(
                            Images.logoimage,
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Selamat datang ',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: Provider.of<LoginProvider>(context,
                                      listen: false)
                                  .getUsername()
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
