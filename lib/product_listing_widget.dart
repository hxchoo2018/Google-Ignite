import 'package:easy_debounce/easy_debounce.dart';
import 'package:ecomm_app/app_theme.dart';
import 'package:ecomm_app/bloc/event/cart_event.dart';
import 'package:ecomm_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/state/cart_state.dart';
import 'models/product.dart';

class ProductListingWidget extends StatefulWidget {
  const ProductListingWidget({Key? key}) : super(key: key);

  @override
  _ProductListingWidgetState createState() => _ProductListingWidgetState();
}

class _ProductListingWidgetState extends State<ProductListingWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSearchStarted = false;

  List<Product> searchedProducts = [];
  final List<Product> products = [
    Product(
        id: 1,
        name: 'Brocolli',
        image:'https://images.unsplash.com/photo-1518164147695-36c13dd568f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        category:'vegetable',
        description: 'from NTUC',
        price: 2.0
        ),

    Product(
        id: 2,
        name: 'Potato',
        image:
            'https://images.unsplash.com/photo-1518977676601-b53f82aba655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        category:'vegetable',
        description: 'from NTUC',
        price: 5.0),

    Product(
        id: 3,
        name: 'Salmon',
        image:
            'https://images.unsplash.com/photo-1641898378373-0ef528eec4be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
        category:'fish',
        description: 'from NTUC',
        price: 6.5),

    Product(
        id: 4,
        name: 'Sirloin Steak',
        image:
            'https://images.unsplash.com/photo-1603048297172-c92544798d5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lYXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        category:'meat',
        description: 'from NTUC',
        price: 8.5),

    Product(
        id: 5,
        name: 'Milk',
        image:
            'https://images.unsplash.com/photo-1563636619-e9143da7973b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
        category:'dairy',
        description: 'from NTUC',
        price: 67.5)
  ];

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Awesome Store',
          style: AppTheme.of(context).title1,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton.icon(
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    //Navigator.pushNamed(context, CartPage.routeName);
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text(''),
                  key: Key('cart'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.of(context).primaryBackground,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: Icon(
                        Icons.search_rounded,
                        color: Color(0xFF95A1AC),
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          onChanged: (_) => EasyDebounce.debounce(
                            'tFMemberController',
                            Duration(milliseconds: 0),
                            () {
                              isSearchStarted =
                                  textController!.text.isNotEmpty && textController!.text.trim().length > 0;
                              print('isSearchStarted $isSearchStarted');
                              if (isSearchStarted) {
                                print('${textController!.text.trim()}');
                                searchedProducts = products
                                    .where((item) =>
                                        item.name.toLowerCase().contains(textController!.text.trim().toLowerCase()))
                                    .toList();
                              }
                              setState(() {});
                            },
                          ),
                          decoration: InputDecoration(
                            labelText: 'Search product here...',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: AppTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF95A1AC),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
                  bool isGridView = cartState.isGridView;
                  return IconButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context).add(ChangeGallaryView(!isGridView));
                      },
                      icon: !isGridView ? Icon(Icons.grid_on) : Icon(Icons.list));
                }),
              ],
            ),
          ),
          Expanded(
            child: ProductList(
              products: isSearchStarted ? searchedProducts : products,
            ),
          ),
        ],
      ),
    );
  }
}
