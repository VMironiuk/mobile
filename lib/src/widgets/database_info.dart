import 'package:flutter/material.dart';
import 'package:lichess_mobile/src/db/database.dart';
import 'package:lichess_mobile/src/widgets/list.dart';

class DatabaseInfo extends StatefulWidget {
  @override
  _DatabaseInfoState createState() => _DatabaseInfoState();
}

class _DatabaseInfoState extends State<DatabaseInfo> {
  double _databaseSize = 0.0;

  @override
  void initState() {
    super.initState();
    _loadDatabaseSize();
  }

  Future<void> _loadDatabaseSize() async {
    final double size = await getDatabaseSizeInMB();
    setState(() {
      _databaseSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListSection(
      hasLeading: true,
      showDivider: true,
      children: [
        PlatformListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete databases'),
          trailing: Text(
            '${_databaseSize.toStringAsFixed(2)} MB', 
            style: const TextStyle(
              fontWeight: FontWeight.w200,
            ),
          ),
          onTap: () {
            deleteDatabaseFile();
          },
        ),
      ],
    );
  }
}
