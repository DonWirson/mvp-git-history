import 'package:flutter/material.dart';

import 'branch_list_page.dart';
import 'all_commits_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  final pageController = PageController();
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: Colors.black87,
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.black,
        tabs: const [
          Tab(
            text: "Commits",
            icon: Icon(Icons.edit_outlined),
          ),
          Tab(
            text: "Branches",
            icon: Icon(Icons.html_outlined),
          ),
        ],
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: const Text("Check your commits :D"),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(
              20,
            ),
            child: AllCommitsPage(),
          ),
          BranchListPage(),
        ],
      ),
    );
  }
}
