import 'package:flutter/material.dart';
import 'package:trickcal_note_revive/widgets/settings/active_board_type_view.dart';
import 'package:trickcal_note_revive/widgets/settings/changing_is_show_name_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with SingleTickerProviderStateMixin {
  static const Color _color = Color(0xFFC0DC7F);

  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if(_isExpanded) {
              _controller.reverse().then((_) {
                setState(() {
                  _isExpanded = false;
                });
              });
            } else {
              setState(() {
                _isExpanded = true;
                _controller.forward();
              });
            }
          },
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _isExpanded
                  ? BorderRadius.vertical(top: Radius.circular(8))
                  : BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '설정',
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: SizeTransition(
            sizeFactor: _animation,
            axisAlignment: -1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: _color),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '표시할 보드',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const ActiveBoardTypeView(),
                  const SizedBox(height: 8),
                  Divider(color: _color),
                  const ChangingIsShowNameButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}