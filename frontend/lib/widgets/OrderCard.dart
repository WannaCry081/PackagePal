import "package:flutter/material.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/viewmodels/storage_viewmodel.dart";

class OrderCard extends StatefulWidget {

  final void Function() ? orderCardOpenContents;
  final String packageName;
  final String status;
  final String deliveryDate;

  const OrderCard({
    Key ? key,
    this.orderCardOpenContents,
    required this.packageName,
    required this.status,
    required this.deliveryDate,
  }) : super(key : key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {

  late String orderAvatar;

  @override
  void initState() {
    super.initState();
    fetchOrderAvatar();
  }
  Future<void> fetchOrderAvatar() async {
    String avatar = await StorageViewModel().getImage("Avatar.png");
    setState(() {
      orderAvatar = avatar;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
     onTap: widget.orderCardOpenContents,
      child: Container(
       height: 75,
       width: MediaQuery.of(context).size.width,
       padding: const EdgeInsets.all(8),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
         border: Border.all(color: Colors.grey.shade300)
       ),
       child: Row(
         children: [
            CircleAvatar(
              backgroundImage: NetworkImage(orderAvatar),
              radius: 23,
            ),
           const SizedBox(width: 8.0),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               titleText(
                 widget.packageName,
                 titleSize: 16.0,
                 titleColor: Colors.grey[800],
                 titleWeight: FontWeight.bold,
                 titleOverflow: TextOverflow.ellipsis
               ),
               bodyText(
                 widget.deliveryDate,
                 bodySize: 13.0,
                 bodyColor: Colors.grey[800],
                 bodyOverflow: TextOverflow.ellipsis
               )
             ],
           ),
           const Spacer(),
           Container(
             margin: const EdgeInsets.symmetric(horizontal: 10),
             decoration: BoxDecoration(
               color: Theme.of(context).colorScheme.primary,
               borderRadius: BorderRadius.circular(7.0)
             ),
             child: Padding(
               padding: const EdgeInsets.all(6.0),
               child: bodyText(
                 widget.status,
                 bodySize: 13,
                 bodyColor: Colors.white
               ),
             ),
           )
         ]
       )
     ),
    );
  }
}