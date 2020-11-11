import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pemaspenge/controller/homeController.dart';
import 'package:pemaspenge/theme/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final ScreenUtil scu = ScreenUtil();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          AppBarHomePage(
            homeController: homeController,
          ),
          BannerHomePage(scu: scu),
          ContentHomePage(scu: scu)
        ],
      ),
    );
  }
}

class ContentHomePage extends StatelessWidget {
  const ContentHomePage({
    Key key,
    @required this.scu,
  }) : super(key: key);

  final ScreenUtil scu;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: DefaultTheme.paddingContainer(scu)
            .copyWith(top: scu.pixelRatio * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buku kas kamu',
              style: DefaultTheme.textStyle(scu).copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: scu.pixelRatio * 3),
            Container(
              width: double.infinity,
              height: scu.pixelRatio * 40,
              child: Swiper(
                loop: false,
                viewportFraction: .93,
                itemCount: 5,
                itemWidth: double.infinity,
                itemBuilder: (BuildContext context, int index) {
                  return index == 4
                      ? Container(
                          width: 10,
                          height: 10,
                          child: Icon(Icons.add),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red
                          ),
                        )
                      : CardBukuKas(scu: scu);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardBukuKas extends StatelessWidget {
  const CardBukuKas({
    Key key,
    @required this.scu,
  }) : super(key: key);

  final ScreenUtil scu;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // padding: EdgeInsets.all(scu.pixelRatio * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Buku kas',
                        style: DefaultTheme.textStyle(scu).copyWith(
                            color: Colors.black,
                            fontSize: scu.pixelRatio * 5,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Rp. 5.000.000',
                        style: DefaultTheme.textStyle(scu).copyWith(
                            color: Colors.grey[600],
                            fontSize: scu.pixelRatio * 4),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://ui-avatars.com/api/?background=ff765f',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_drop_up, color: Colors.green),
                              Text(
                                'Rp. 10.000.000',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Rp. 10.000.000',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.red),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BannerHomePage extends StatelessWidget {
  const BannerHomePage({
    Key key,
    @required this.scu,
  }) : super(key: key);

  final ScreenUtil scu;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DisplayTotalSaldo(scu: scu),
    );
  }
}

class DisplayTotalSaldo extends StatelessWidget {
  const DisplayTotalSaldo({
    Key key,
    @required this.scu,
  }) : super(key: key);

  final ScreenUtil scu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scu.screenWidth,
      // height: scu.screenHeight / 4,
      decoration: BoxDecoration(
        color: ColorTheme.primaryColor(),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: DefaultTheme.paddingContainer(scu),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo Kamu',
                      style: DefaultTheme.textStyle(scu),
                    ),
                    Text('Rp. 10.000.000',
                        style: DefaultTheme.textStyle(scu)
                            .copyWith(fontSize: scu.pixelRatio * 10)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pemasukan Hari Ini',
                          style: DefaultTheme.textStyle(scu),
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_drop_up, color: Colors.green),
                            Text(
                              'Rp. 10.000.000',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Pengeluaran Hari Ini',
                          style: DefaultTheme.textStyle(scu),
                        ),
                        Row(
                          children: [
                            Text(
                              'Rp. 10.000.000',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.red),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(height: 10),
              ],
            ),
          ),
          Divider(color: Colors.white),
          Container(
            padding: DefaultTheme.paddingContainer(scu)
                .copyWith(bottom: scu.pixelRatio * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lihat semua buku kas',
                  style: DefaultTheme.textStyle(scu).copyWith(
                    fontSize: scu.pixelRatio * 4,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  size: scu.pixelRatio * 7,
                  color: Colors.white.withOpacity(.8),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarHomePage extends StatelessWidget {
  const AppBarHomePage({
    Key key,
    @required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      // backgroundColor: Colors.red,
      backgroundColor: ColorTheme.primaryColor(),
      title: Row(
        children: [
          Icon(
            Icons.attach_money,
            size: 20,
          ),
          Text(
            'PEMASPENGE',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => {homeController.doLogout()},
        ),
      ],
    );
  }
}
