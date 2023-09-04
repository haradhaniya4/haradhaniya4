// import 'package:admin_cp/widgets/products_widget.dart';
// import 'package:admin_cp/widgets/user_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../consts/constants.dart';
// import '../services/utils.dart';
// // import 'products_widget.dart';

// class UserListView extends StatelessWidget {
  
//   const UserListView(
//       {Key? key,
//       this.crossAxisCount = 4,
//       this.childAspectRatio = 1,
//       this.isInMain = true})
//       : super(key: key);
//   final int crossAxisCount;
//   final double childAspectRatio;
//   final bool isInMain;
  
//   @override
//   Widget build(BuildContext context) {
//     String email = '';
//     String name = '';
//     final Color color = Utils(context).color;
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//  builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.connectionState == ConnectionState.active) {
//           if (snapshot.data == null) {
//             return const Center(
//               child: Padding(
//                 padding: EdgeInsets.all(18.0),
//                 child: Text('No Users'),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text(
//                 'Something went wrong',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//               ),
//             );
//           }
//         }
//         return ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: snapshot.data!.docs.length,
            
//             // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //   crossAxisCount: crossAxisCount,
//             //   childAspectRatio: childAspectRatio,
//             //   crossAxisSpacing: defaultPadding,
//             //   mainAxisSpacing: defaultPadding,
//             // ),
//             itemBuilder: (context, index) {
//             Axis scrollDirection = Axis.vertical;
//               return  ListTile(
//              title: Text(name.toString()),
//             subtitle: Text(email.toString()),
//               );
//             });
//       },
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserListScreen extends StatefulWidget {
//   const UserListScreen({Key? key, this.crossAxisCount = 4,
//       this.childAspectRatio = 1,
//     this.isInMain = true,
//    required this.email,
//    required this.name}) : super(key: key);
//    final int crossAxisCount;
//   final double childAspectRatio;
//   final bool isInMain;
//    final String name,email;
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
  

//   late User _currentUser;

//   @override
//   void initState() {
//     super.initState();
//     _currentUser = _auth.currentUser!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: _firestore.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.hasData) {
//             List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
//                 snapshot.data!.docs;

//             return ListView.builder(
//               itemCount: documents.length,
//               itemBuilder: (context, index) {
//                 String name = documents[index]['displayName'];
//                 String email = documents[index]['email'];

//                 return ListTile(
//                   title: Text(name),
//                   subtitle: Text(email),
//                 );
//               },
//             );
//           }

//           return Center(child: Text('No data available.'));
//         },
//       ),
//     );
//   }
// }









import 'package:admin_cp/widgets/user_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../consts/constants.dart';
import 'orders_widget.dart';

class userList extends StatelessWidget {
  const userList({Key? key, this.isInDashboard = true,  this.childAspectRatio = 1,
  this.crossAxisCount = 4,
     this.isInMain = true,}) : super(key: key);
  final bool isInDashboard;
   final int crossAxisCount;
   final double childAspectRatio;
  final bool isInMain;

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .snapshots(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data!.docs.isNotEmpty) {
            final data = snapshot.data!.docs.reversed.toList();

            return Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  
                  itemCount: data.length,
                  itemBuilder: (ctx, index) {
                    Axis scrollDirection = Axis.vertical;
                    return Column(
                      children: [
                       userwidget(
                         email: data[index]['email'],
                          name: data[index]['name'],
                       
                        ),
                        const Divider(
                          thickness: 3,
                        ),
                      ],
                    );
                  }),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('Your store is empty'),
              ),
            );
          }
        }
        return const Center(
          child: Text(
            'Something went wrong',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        );
      },
    );
  }
}
