import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:frontend/core/constants/text_theme.dart";
import "package:frontend/models/order_model.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";
import "package:frontend/views/CreateOrder/index.dart";

class OrderView extends StatefulWidget {
  final Map<String, dynamic> orderData;
  final int index;

  const OrderView({
    Key? key,
    required this.orderData,
    required this.index,
  }) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  late OrderModel orderModel;

  @override
  void initState() {
    super.initState();
    orderModel = OrderModel.fromMap(widget.orderData);
  }

  
  @override
  Widget build(BuildContext context) {
    final db = DatabaseViewModel();

    final name = widget.orderData['name'] as String;
    final pin = widget.orderData['pin'] as String;
    final weight = widget.orderData['weight'] as String;
    final price = widget.orderData['price'] as String;
    final status = widget.orderData['status'] as String;
    final deliveryName = widget.orderData['deliveryName'] as String;
    final deliveryContact = widget.orderData['deliveryContact'] as String;
    final deliveryDate = widget.orderData['deliveryDate'] as String;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(FeatherIcons.arrowLeft)
                    ),
                  ),
                  titleText(
                    "Order Details",
                    titleSize: 20.0,
                    titleWeight: FontWeight.bold,
                    titleColor: Colors.grey[700]
                  ),

                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => CreateOrderView(
                          index: widget.index, initialOrder: orderModel, isEditMode: true,))
                      );
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary.withAlpha(40),
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        FeatherIcons.edit,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20.0,
                        weight: 5.0,
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await db.deleteOrder(widget.index);

                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.of(context).pop();

                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          shape: BoxShape.circle
                        ),
                        child: Icon(
                          FeatherIcons.trash,
                          color: Colors.red[500],
                          size: 20.0,
                          weight: 5.0,
                        )
                    ),
                  ),
                ],
              ),
            ),
        
            // Package Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(20),
                   boxShadow: [
                     BoxShadow(
                      offset: const Offset(0, 15),
                      spreadRadius: 0,
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.10),
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      decoration: const BoxDecoration(
                        color:  Color.fromARGB(255, 13, 21, 23),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/CardIllustration.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleText(
                              name,
                              titleSize: 20.0,
                              titleWeight: FontWeight.w600,
                              titleAlignment: TextAlign.right,
                              titleColor: Theme.of(context).colorScheme.tertiary
                            ),
                            Divider(color: Colors.grey[200]),
                            const SizedBox(height: 10.0),
                            itemDetail(context, "Item ID","dk30c3nd", "Product PIN", pin),
                            itemDetail(context, "Price","Php $price", "Weight", "$weight kg"),
                          ],
                        ),
                      ),
                    )
                
                  ],
                ),
              )
            ),
        
        
            // Courier Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 236, 226),
                   borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                       BoxShadow(
                        offset: const Offset(0, 15),
                        spreadRadius: 0,
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.10),
                      )
                  ]
                ),
                child: Column(
                  children: [
                    Row(
                    children: [
                      Container( 
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(right: 18.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        child:  CircleAvatar(
                          backgroundImage: NetworkImage(AuthViewModel().getUserPhotoUrl),
                          radius: 25,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(
                            deliveryName,
                            titleWeight: FontWeight.bold,
                            titleSize: 20.0,
                            titleColor: Colors.grey[800]
                          ),
                          bodyText(
                            "Courier",
                            bodyWeight: FontWeight.w600,
                            bodySize: 16.0,
                            bodyColor: Theme.of(context).colorScheme.secondary
                          ),
                        ],
                      )
                    ],),
                      
                    const SizedBox(height: 15.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
                        children: [
                          titleText(
                            "Contact:",
                            titleSize: 18.0,
                            titleColor: Colors.grey[700]
                          ),
                          const SizedBox(width: 10),
                          bodyText(
                            deliveryContact,
                            bodySize: 18.0,
                            bodyColor: Colors.grey[800],
                            bodyWeight: FontWeight.w600
                          ),
                          const Spacer(),
                          Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle
                          ),
                          child: const Icon(FeatherIcons.phone,
                            color: Colors.white,
                            size: 20,
                          )),
                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
        
            const SizedBox(height: 20.0),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bodyText(
                          "Delivery Date",
                          bodySize: 16.0
                        ),
                        bodyText(
                          deliveryDate,
                          bodySize: 18.0,
                          bodyColor: Theme.of(context).colorScheme.secondary,
                          bodyWeight: FontWeight.w600
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bodyText(
                          "Status",
                          bodySize: 16.0
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(7.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: bodyText(
                              status,
                              bodySize: 13,
                              bodyColor: Colors.white,
                              bodyWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ),
            )
        
            
          ],
        )
      ),
    );
  }

  Widget itemDetail (context, label1, data1, label2, data2) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                bodyText(
                  label1,
                  bodySize: 14.0,
                  bodyColor: Colors.grey[600]
                ),
              ],
            ),
            const SizedBox(height: 5.0),
        
            titleText(
              data1,
              titleSize: 16.0,
              titleWeight: FontWeight.bold
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                bodyText(
                  label2,
                  bodySize: 14.0,
                  bodyColor: Colors.grey[600],
                ),
              ],
            ),
            const SizedBox(height: 5.0),
        
            titleText(
              data2,
              titleSize: 16.0,
              titleWeight: FontWeight.bold
            )
          ],
        ),
      ],
    ),
  );
}