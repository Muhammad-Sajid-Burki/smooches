// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smooches/core/models/simplified_contact.dart';
// import 'package:smooches/ui/screens/add_contact/widgets/contact_list.dart';
//
//
// class AddContactsScreen extends StatefulWidget {
//   // Get contacts permission
//   @override
//   _AddContactsScreenState createState() => _AddContactsScreenState();
// }
//
// class _AddContactsScreenState extends State<AddContactsScreen> {
//   final GlobalKey<dynamic> contactWidgetKey = GlobalKey();
//
//   List<SimplifiedContact> selectedContacts = [];
//   List<int> selectedContactIndices = [];
//
//   void onContactSelect(List<SimplifiedContact> contacts, List<int> indices) {
//     this.setState(() {
//       selectedContacts = contacts;
//       selectedContactIndices = indices;
//     });
//   }
//
//   Future<void> onContactBtnPress(BuildContext context) async {
//     showDialog(
//       context: context,
//       barrierColor: Colors.white,
//       barrierDismissible: false,
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           brightness: Brightness.light,
//           textTheme: TextTheme(
//             headline6: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.black,
//           ),
//           title: Text('Select Contact', style: TextStyle(color: Colors.red),),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.check),
//               onPressed: () {
//                 contactWidgetKey.currentState.onDone(context);
//               },
//             )
//           ],
//         ),
//         body: Column(
//           children: [
//             Container(
//               child: ContactList(
//                 key: contactWidgetKey,
//                 onDone: onContactSelect,
//                 selectedContactIndices: selectedContactIndices,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               child: ElevatedButton(
//                 onPressed: () {
//                   onContactBtnPress(context);
//                 },
//                 child: Text('Select Contacts'),
//               ),
//             ),
//             Container(
//               child: Flexible(
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: selectedContacts.length ?? 0,
//                   itemBuilder: (BuildContext context, int index) {
//                     SimplifiedContact? contact =
//                     selectedContacts.elementAt(index);
//
//                     return Column(
//                       children: [
//                         ListTile(
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 2,
//                             horizontal: 18,
//                           ),
//                           title: Text(contact.name!),
//                           subtitle: Text(contact.phone!),
//                         ),
//                         Divider(
//                           height: 1,
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AddContactsScreen extends StatefulWidget {
  @override
  _AddContactsScreenState createState() => _AddContactsScreenState();
}

class _AddContactsScreenState extends State<AddContactsScreen> {
  @override
  void initState() {
    super.initState();
    _askPermissions('');
  }

  Future<void> _askPermissions(String routeName) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      if (routeName != null) {
        Navigator.of(context).pushNamed(routeName);
      }
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
      SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts Plugin Example')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Contacts list'),
              onPressed: () => _askPermissions('/contactsList'),
            ),
            ElevatedButton(
              child: const Text('Native Contacts picker'),
              onPressed: () => _askPermissions('/nativeContactPicker'),
            ),
          ],
        ),
      ),
    );
  }
}