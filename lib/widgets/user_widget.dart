// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../inner_screens/edit_prod.dart';
// import '../services/global_method.dart';
// import '../services/utils.dart';
// import 'text_widget.dart';

// class userWidget extends StatefulWidget {
//   const userWidget({
//     Key? key,
//     required this.id,
//   }) : super(key: key);
//   final String id;
//   @override
//   _ProductWidgetState createState() => _ProductWidgetState();
// }

// class _ProductWidgetState extends State<userWidget> {
//   String email = '';
//   String name = '';
  

//   @override
//   void initState() {
//     getProductsData();
//     super.initState();
//   }
// Future<void> getProductsData() async {
//   try {
//     // Assume you have a Firestore instance and a DocumentReference for productsDoc
//     DocumentSnapshot productsDoc = await FirebaseFirestore.instance.collection('users').doc('your_doc_id').get();

//     if (!productsDoc.exists) {
//       return;
//     } else {
//       print("My " + productsDoc.toString());

//       // Assuming this is part of a StatefulWidget
//       if (mounted) {
//         setState(() {
//           email = productsDoc.get('email');
//           name = productsDoc.get('name');
//         });
//       }
//     }
//   } catch (error) {
//     GlobalMethods.errorDialog(subtitle: '$error', context: context);
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     Size size = Utils(context).getScreenSize;

//     final color = Utils(context).color;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(12),
//         color: Theme.of(context).cardColor.withOpacity(0.6),
//         // child: InkWell(
//         //   borderRadius: BorderRadius.circular(12),
//         //   onTap: () {
//         //     Navigator.of(context).push(
//         //       MaterialPageRoute(
//         //         builder: (context) => EditProductScreen(
//         //           id: widget.id,
//         //           title: title,
//         //           price: price,
//         //           salePrice: salePrice,
//         //           productCat: productCat,
//         //           imageUrl: imageUrl == null
//         //               ? 'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png'
//         //               : imageUrl!,
//         //           isOnSale: isOnSale,
//         //           isPiece: isPiece,
//         //         ),
//         //       ),
//           //  );
//        //   },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     Flexible(
//                 //       flex: 3,
//                 //       child: imageUrl != null
//                 //           ? CachedNetworkImage(
//                 //               imageUrl: imageUrl!,
//                 //               fit: BoxFit.fill,
//                 //               height: size.width * 0.12,
//                 //             )
//                 //           : Text('waiting...'),
//                 //       // child: CachedNetworkImage(
//                 //       //   imageUrl == null
//                 //       //       ? 'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png'
//                 //       //       :  imageUrl!,

//                 //       //   fit: BoxFit.fill,
//                 //       //   // width: screenWidth * 0.12,
//                 //       //   height: size.width * 0.12,

//                 //       //   // errorBuilder: (context, error, stackTrace) {
//                 //       //   //   print("Image Loading Error: $error");
//                 //       //   //   return Text("Image Loading Error");
//                 //       //   // },
//                 //       // ),
//                 //     ),
//                 //     const Spacer(),
//                 //     PopupMenuButton(
//                 //         itemBuilder: (context) => [
//                 //               PopupMenuItem(
//                 //                 onTap: () {},
//                 //                 child: const Text('Edit'),
//                 //                 value: 1,
//                 //               ),
//                 //               PopupMenuItem(
//                 //                 onTap: () {},
//                 //                 child: const Text(
//                 //                   'Delete',
//                 //                   style: TextStyle(color: Colors.red),
//                 //                 ),
//                 //                 value: 2,
//                 //               ),
//                 //             ])
//                 //   ],
//                 // ),
//                 // const SizedBox(
//                 //   height: 2,
//                 // ),
               
               
//                     TextWidget(
//                       text: name.toString(),
//                       color: color,
//                       textSize: 18,
//                     ),
//                     const SizedBox(
//                       width: 7,
//                     ),
                    
                 
//                     const Spacer(),
//                     TextWidget(
//                       text: email.toString(),
//                       color: color,
//                       textSize: 18,
//                     ),
//                   ],
                
              
//             ),
//           ),
//         ),
    
      
//     );
//   }
// }




import 'package:admin_cp/services/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:grocery_admin_panel/services/utils.dart';

import 'text_widget.dart';

class userwidget extends StatefulWidget {
  const userwidget(
      {Key? key,
      required this.name,
      required this.email,
    })
  : super(key: key);

  final String name,email;

  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<userwidget> {
    FirebaseAuth _auth = FirebaseAuth.instance;
   FirebaseFirestore _firestore = FirebaseFirestore.instance; 
   
  

  late User _currentUser;

  @override
  void initState() {
    _currentUser = _auth.currentUser!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = theme == true ? Colors.white : Colors.black;
    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Flexible(
              //   flex: size.width < 650 ? 3 : 1,
              //   child: Image.network(
              //     widget.imageUrl,

              //     fit: BoxFit.fill,
              //     // height: screenWidth * 0.15,
              //     // width: screenWidth * 0.15,
              //   ),
              // ),
              const SizedBox(
                width: 12,
              ),
     
        
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text:
                        '${widget.email}',
                      color: color,
                      textSize: 16,
                      isTitle: true,
                    ),
         
               Row(
                        children: [
                          TextWidget(
                            text: ('${widget.name}'),
                            color: Colors.blue,
                             textSize: 16,
                            isTitle: true,
                          ),
                          // Text('${widget.name}')
                        ],
                      ),
                    
                    // Text(
                    //   orderDateStr),
                  ],
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}




