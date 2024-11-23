import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cano/desginsystem/colors.dart';
import 'package:cano/desginsystem/strings.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cano/viewmodel/menu/menu_viewmodel.dart';
import 'package:cano/data/model/menu/menu_info.dart';
import 'package:cano/viewmodel/review/review_viewmodel.dart';
import 'package:cano/data/model/review/review_info.dart';
import 'package:intl/intl.dart';

class MenuReportScreen extends ConsumerWidget {
  const MenuReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
            ),
            onPressed: () => context.pop()),
      ),
      backgroundColor: Colors.white,
    );
  }
}
