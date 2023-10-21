import 'package:flutter/material.dart';
// import 'package:flutterlpsetest/provider/login_provider.dart';
// import 'package:flutterlpsetest/provider/profile_provider.dart';
import 'package:flutterlpsetest/utils/color_resources.dart';
import 'package:flutterlpsetest/utils/custom_themes.dart';
import 'package:flutterlpsetest/utils/dimensions.dart';
import 'package:flutterlpsetest/utils/images.dart';
import 'package:flutterlpsetest/views/home/widget/info_profile.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  HomePage({super.key});

  // Future<void> _loadData(BuildContext context, bool reload) async {
  //   bool isGuestMode =
  //       !Provider.of<LoginProvider>(context, listen: false).isLoggedIn();

  //   if (!isGuestMode) {
  //     await Provider.of<ProfileProvider>(context, listen: false)
  //         .getUserInfo(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // _loadData(context, false);

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Colors.white,
          onRefresh: () async {
            // await _loadData(context, true);
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // App Bar
              SliverAppBar(
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Image.asset(Images.logoimagewithname,
                    height: 35, color: ColorResources.WHITE),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Stack(clipBehavior: Clip.none, children: [
                      Image.asset(
                        Images.notif,
                        height: Dimensions.ICON_SIZE_DEFAULT,
                        width: Dimensions.ICON_SIZE_DEFAULT,
                        color: Colors.white,
                      ),
                      Positioned(
                        top: -4,
                        right: -4,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: ColorResources.RED,
                          child: Text("2",
                              style: maisonSemiBold.copyWith(
                                color: ColorResources.WHITE,
                                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                              )),
                        ),
                      ),
                    ]),
                  )
                ],
              ),

              // Pencarian
              SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegate(
                      child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_SMALL,
                          vertical: 5),
                      color: Theme.of(context).colorScheme.secondary,
                      alignment: Alignment.center,
                      child: Container(
                        padding:
                            const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        height: 50,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: ColorResources.getGrey(context),
                          borderRadius: BorderRadius.circular(
                              Dimensions.PADDING_SIZE_SMALL),
                        ),
                        child: Row(children: [
                          Icon(Icons.search,
                              color: ColorResources.getPrimary(context),
                              size: Dimensions.ICON_SIZE_DEFAULT),
                          const SizedBox(width: 5),
                          Text("Masukan kata kunci pencarian",
                              style: maisonRegular.copyWith(
                                  color: Theme.of(context).hintColor)),
                        ]),
                      ),
                    ),
                  ))),

              const SliverToBoxAdapter(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        InfoProfile(),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 ||
        oldDelegate.minExtent != 50 ||
        child != oldDelegate.child;
  }
}
