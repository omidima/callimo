// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:callimoo/logic/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:callimoo/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp());

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });

  test("email checker", () {
    RegExp r = RegExp(r'.[a-zA-z0-9\._]*@.[a-zA-Z]*\.[a-z]*');
    String email =
        "qwervbjkqerv qwevjb qjkw rvomid8144@gmail.com iubewvliba'vbiwebv'wbeivwr vwrjbkv;qwbrv";

    var m = r.allMatches(email);
    print(m.first.group(0));
  });

  test("title find", () {
      print(titleFinder(
        '#جلسه_تصویری\n :telephone_receiver: یک جلسه تصویری توسط user pass ساخته شد. وارد شوید: **[asdvasdv](https://test.limonadapp.ir/Limonad/api/v1/bbb/join/719ead22-9773-489d-8515-5f58c7e50cb0)**\n:stopwatch: لینک ورود تا 24 ساعت معتبر است.\n:warning: برای ورود به جلسه باید در لیمو وارد شده باشید.\n:unlock: برای ورود مهمانانی که در لیمو حساب کاربری ندارند از لینک زیر استفاده کنید: \nhttps://test.limonadapp.ir/Limonad/api/v1/bbb/join/guest/719ead22-9773-489d-8515-5f58c7e50cb0/gq0HNsvvTUPTARxt1LHv \n'));
  });

  test("public link find", () {
    print(publicLinkFinder(
        '#جلسه_تصویری\n :telephone_receiver: یک جلسه تصویری توسط user pass ساخته شد. وارد شوید: **[asdvasdv](https://test.limonadapp.ir/Limonad/api/v1/bbb/join/719ead22-9773-489d-8515-5f58c7e50cb0)**\n:stopwatch: لینک ورود تا 24 ساعت معتبر است.\n:warning: برای ورود به جلسه باید در لیمو وارد شده باشید.\n:unlock: برای ورود مهمانانی که در لیمو حساب کاربری ندارند از لینک زیر استفاده کنید: \nhttps://test.limonadapp.ir/Limonad/api/v1/bbb/join/guest/719ead22-9773-489d-8515-5f58c7e50cb0/gq0HNsvvTUPTARxt1LHv \n'));
  });

  test("admin link find", () {
    print(adminLinkFinder(
        '#جلسه_تصویری\n :telephone_receiver: یک جلسه تصویری توسط user pass ساخته شد. وارد شوید: **[asdvasdv](https://test.limonadapp.ir/Limonad/api/v1/bbb/join/719ead22-9773-489d-8515-5f58c7e50cb0)**\n:stopwatch: لینک ورود تا 24 ساعت معتبر است.\n:warning: برای ورود به جلسه باید در لیمو وارد شده باشید.\n:unlock: برای ورود مهمانانی که در لیمو حساب کاربری ندارند از لینک زیر استفاده کنید: \nhttps://test.limonadapp.ir/Limonad/api/v1/bbb/join/guest/719ead22-9773-489d-8515-5f58c7e50cb0/gq0HNsvvTUPTARxt1LHv \n'));
  });
}
