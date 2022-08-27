import 'package:callimoo/logic/constants/colors/app_colors.dart';
import 'package:callimoo/presentation/screens/main/home/home_screen.dart';
import 'package:callimoo/presentation/screens/main/services_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/hive/dto/app_dto.dart';
import '../../../data/provider/websoket/socket_manager.dart';
import '../../../data/repositories/config_repository.dart';
import '../../../logic/util/logger.dart';
import 'call_log/call_log_screen.dart';

class MainScreen extends StatefulWidget {
  static get pageName => "/";
  static get route => MaterialPageRoute(
        settings: const RouteSettings(name: "/"),
        builder: (context) => const MainScreen(),
      );
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _activeItem = 0;
  PageController controller = PageController(
    initialPage: 0,
  );

  socket() async {
    await ConfigRepository.getInstance.config();
    if (AppDto.getWorkspace != null) {
      SocketManager.getInstance
          .addWebSocket(AppDto.getWorkspace!.workerNode!.websocketUrl!);
    }
  }

  @override
  void initState() {
    socket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [HomeScreen(), CallLimooScreen(), ServicesScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeItem,
        onTap: (index) {
          controller.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          setState(() {
            _activeItem = index;
          });
        },
        selectedItemColor: AppColors.secondaryColor,
        selectedIconTheme: const IconThemeData(color: AppColors.secondaryColor),
        unselectedIconTheme: const IconThemeData(color: AppColors.grey_4),
        unselectedItemColor: AppColors.grey_4,
        items: const [
          BottomNavigationBarItem(label: "خانه", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "تاریخچه جلسه‌ها", icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              label: "سرویس‌ها", icon: Icon(Icons.qr_code_rounded)),
        ],
      ),
    );
  }
}
