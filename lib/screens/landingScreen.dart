import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Helper/qrgenerate.dart';
import 'package:my_app/screens/QRScan.dart';
import 'package:my_app/screens/bookForSomeone.dart';
import 'package:my_app/screens/manageQueue.dart';
import 'package:my_app/screens/customerDashboard.dart';
import 'package:my_app/screens/moreTab.dart';
import 'package:my_app/screens/personalCustomerDashboard.dart';
import 'package:my_app/screens/shopListView.dart';

class landingScreen extends StatefulWidget {
  @override
  _landingScreenState createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {
  final _tabNavigator = GlobalKey<TabNavigatorState>();
  final _tab1 = GlobalKey<NavigatorState>();
  final _tab2 = GlobalKey<NavigatorState>();
  final _tab3 = GlobalKey<NavigatorState>();
  final _tab4 = GlobalKey<NavigatorState>();

  var _tabSelectedIndex = 0;
  var _tabPopStack = false;

  void _setIndex(index) {
    setState(() {
      _tabPopStack = _tabSelectedIndex == index;
      _tabSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _tabNavigator.currentState.maybePop(),
      child: Scaffold(
        body: TabNavigator(
          key: _tabNavigator,
          tabs: <TabItem>[
            TabItem(_tab1, customerDashboard()),
            TabItem(_tab2, GenerateScreen()),
            TabItem(_tab3, bookQueue()),
            TabItem(_tab4, bookForSomeone()),
          ],
          selectedIndex: _tabSelectedIndex,
          popStack: _tabPopStack,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabSelectedIndex,
          onTap: _setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: const Text('Dashboard'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera),
              title: const Text('Generate QR'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.queue),
              title: const Text('ManageQueue'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessible),
              title: const Text('Booking Assistance'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageWithButton extends StatelessWidget {
  final String title;
  final int count;

  const PageWithButton({
    Key key,
    @required this.title,
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("$title $count"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PageWithButton(title: title, count: count + 1),
            ));
          },
        ),
      ),
    );
  }
}

class TabItem {
  final GlobalKey<NavigatorState> key;
  final Widget tab;

  const TabItem(this.key, this.tab);
}

class TabNavigator extends StatefulWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final bool popStack;

  TabNavigator({
    Key key,
    @required this.tabs,
    @required this.selectedIndex,
    this.popStack = false,
  }) : super(key: key);

  @override
  TabNavigatorState createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  ///
  /// Try to pop widget, return true if popped
  ///
  Future<bool> maybePop() {
    return widget.tabs[widget.selectedIndex].key.currentState.maybePop();
  }

  _popStackIfRequired(BuildContext context) async {
    if (widget.popStack) {
      widget.tabs[widget.selectedIndex].key.currentState
          .popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('selectedIndex=${widget.selectedIndex}, popStack=${widget.popStack}');

    _popStackIfRequired(context);

    return Stack(
      children: List.generate(widget.tabs.length, _buildTab),
    );
  }

  Widget _buildTab(int index) {
    return Offstage(
      offstage: widget.selectedIndex != index,
      child: Opacity(
        opacity: widget.selectedIndex == index ? 1.0 : 0.0,
        child: Navigator(
          key: widget.tabs[index].key,
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => widget.tabs[index].tab,
          ),
        ),
      ),
    );
  }
}