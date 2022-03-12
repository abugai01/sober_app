import 'package:flutter/material.dart';
import 'package:sober_app/config/style.dart';
import 'package:sober_app/helpers/date_formatter.dart';
import 'package:sober_app/models/helpers/progress.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/pages/main/widgets/circular_percent_indicator.dart';
import 'package:sober_app/widgets/custom_text.dart';

//todo: is it ok with the bloc architecture?
class StreakCounterV3 extends StatefulWidget {
  final Streak streak;

  const StreakCounterV3(this.streak, {Key? key}) : super(key: key);

  @override
  _StreakCounterV3State createState() => _StreakCounterV3State();
}

class _StreakCounterV3State extends State<StreakCounterV3>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Progress progress = Progress(widget.streak);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.64,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //CustomTabBar(),
            Container(
              height: 28,
              width: MediaQuery.of(context).size.width * 0.8,
              //padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                color: themeUltraLightGrey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: themeExtraLightGrey,
                ),
                //labelColor: Colors.white,
                //unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                      child:
                          CustomText('Day', size: 12, weight: FontWeight.w300)),
                  Tab(
                      child: CustomText('Month',
                          size: 12, weight: FontWeight.w300)),
                  Tab(
                      child: CustomText('Year',
                          size: 12, weight: FontWeight.w300)),
                ],
              ),
            ),
            Expanded(flex: 3, child: Container()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.36,
              child: TabBarView(
                controller: _tabController,
                children: [
                  //todo: manage circle indicator height!
                  CircularIndicator(
                    //todo: multiple modes (day, month, year) + maybe a week?
                    percent: progress.days,
                    streak: widget.streak,
                  ),
                  CircularIndicator(
                    //todo: multiple modes (day, month, year) + maybe a week?
                    percent: progress.months,
                    streak: widget.streak,
                  ),
                  CircularIndicator(
                    //todo: multiple modes (day, month, year) + maybe a week?
                    percent: progress.months,
                    streak: widget.streak,
                  ),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            const Divider(
              height: 20,
              thickness: 0.5,
              indent: 30,
              endIndent: 30,
              color: themeExtraLightGrey,
            ),
            const SizedBox(height: 12),
            Column(children: <Widget>[
              CustomText('Since', weight: FontWeight.w300, size: 11),
              const SizedBox(height: 5),
              CustomText(
                  widget.streak
                      .dateOfLastDrinkText(fmt: DateFormats.fullDateText),
                  weight: FontWeight.w300,
                  size: 14),
            ]),
          ]),
    );
  }
}
