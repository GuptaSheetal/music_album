import 'package:first_app/constants/constants.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  TabBarWidget({
    Key? key, 
    required this.index, 
    required this.onChangedTab
    }) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    final Placeholder = Opacity(
      opacity:0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
              buildTabItem(
                index: 0,
                icon: Icon(Icons.home), 
                label: "Home", 
                screenwidth: screenwidth,                
              ),
              buildTabItem(
                index: 1,
                icon: Icon(Icons.tv), 
                label: "TV",
                screenwidth: screenwidth,    
              ),
              Placeholder,
              buildTabItem(
                index: 2,
                icon: Icon(Icons.radio), 
                label: "Radio",
                screenwidth: screenwidth,    
              ),
              buildTabItem(
                index: 3,
                icon: Icon(Icons.notifications), 
                label: "Notification",
                screenwidth: screenwidth,    
              ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required double screenwidth,
    required String label,
    required int index, 
    required Icon icon}) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? primaryColor : Colors.grey,
        size: isSelected ? screenwidth/14 : screenwidth/17.62,
      ),
      child: IconButton(
        onPressed: () => widget.onChangedTab(index), 
        icon: icon,
      ),
    );
  }
}
