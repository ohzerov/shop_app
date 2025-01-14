import 'package:flutter/material.dart';

class HomeTestWidget extends StatelessWidget {
  const HomeTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/image_test_2.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 26, bottom: 19),
            child: Column(
              spacing: 23,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Text(
                    "Моя схема домашнего ухода",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                HomeTestCategories(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 200,
                          child: Text(
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                              maxLines: 2,
                              "Ответьте на 10 вопросов, и мы подберем нужный уход ")),
                      SizedBox(
                        width: 118,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // minimumSize: Size.zero, // Set this
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          onPressed: () {},
                          child: Text(
                            'Пройти тест',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeTestCategories extends StatelessWidget {
  const HomeTestCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 22,
          ),
          HomeTestCategoriesItem(
            imgUrl: 'assets/img_test_prod_1.png',
            title: 'Демакияж',
          ),
          const SizedBox(
            width: 12,
          ),
          HomeTestCategoriesItem(
            imgUrl: 'assets/img_test_prod_2.png',
            title: 'Очищение',
          ),
          const SizedBox(
            width: 12,
          ),
          HomeTestCategoriesItem(
            imgUrl: 'assets/img_test_prod_3.png',
            title: 'Сыворотка',
          ),
          const SizedBox(
            width: 12,
          ),
          HomeTestCategoriesItem(
            imgUrl: 'assets/img_test_prod_4.png',
            title: 'Дневной крем',
          ),
          const SizedBox(
            width: 12,
          ),
          HomeTestCategoriesItem(
            imgUrl: 'assets/img_test_prod_1.png',
            title: 'Маска',
          ),
          const SizedBox(
            width: 22,
          ),
        ],
      ),
    );
  }
}

class HomeTestCategoriesItem extends StatelessWidget {
  const HomeTestCategoriesItem(
      {super.key, required this.imgUrl, required this.title});
  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 10,
        children: [
          Container(
            width: 81,
            height: 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
