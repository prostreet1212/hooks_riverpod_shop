import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_shop/model/coffe_menu.dart';
import 'package:hooks_riverpod_shop/providers/state_provider.dart';
class MyHomePage extends HookConsumerWidget{

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeeMenu> menuList=ref.watch(menuProvider);
    final menuController=ref.watch(menuProvider.notifier);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Кофешоп'),
        actions: [],
      ),
      body: GridView.count(
          shrinkWrap: true,
          //primary: false,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: menuList.map(
                (menu) {
              return Card(
                color: Color.fromARGB(255, 255, 229, 85),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Wrap(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/${menu.image}',
                            fit: BoxFit.fitWidth,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 174, 206, 231),
                              height: 40,
                              width: 40,
                              child: Consumer(builder: (context,ref,child){
                                return IconButton(
                                  icon: Icon(
                                    Icons.shopping_basket,
                                    color:
                                    !menu.isBuy ? Colors.grey : Colors.red,
                                  ),
                                  onPressed: () {
                                    menuController.buyNot(menu);
                                  },
                                );
                              },),

                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          menu.name,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Цена: '),
                            Text(
                              '${menu.price} руб.',
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ).toList()),
    );
  }


}