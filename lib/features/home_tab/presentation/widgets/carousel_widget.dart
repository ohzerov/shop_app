import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/size_config.dart';

List<SliderItem> sliderItems = [
  SliderItem(
      imgUrl: 'assets/image_slider_1.png',
      title: 'Скидка -15%',
      desc: "Сыворотка НА EYE & NECK SERUM",
      btnText: 'Перейти к акции'),
  SliderItem(
      imgUrl: 'assets/image4.png',
      title: '5 средств',
      desc: "для ухода за сухой кожей зимой",
      btnText: 'К разделу'),
  SliderItem(
      imgUrl: 'assets/image5.png',
      title: 'Мужской уход',
      desc: "Для чувствительной и проблемной кожи",
      btnText: 'К разделу')
];

class SliderItem {
  String imgUrl;
  String title;
  String desc;
  String btnText;
  SliderItem({
    required this.imgUrl,
    required this.title,
    required this.desc,
    required this.btnText,
  });
}

class CarouselWidget extends StatefulWidget {
  CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.5,
      child: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _activeIndex = value;
                });
              },
              itemCount: sliderItems.length,
              itemBuilder: (context, index) {
                return PageViewPage(index: index);
              }),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 18),
              child: Row(
                spacing: 4,
                children: List.generate(
                  sliderItems.length,
                  (index) => CircleAvatar(
                    radius: 4,
                    backgroundColor: _activeIndex == index
                        ? Theme.of(context).colorScheme.onTertiary
                        : Color.fromARGB(123, 217, 217, 217),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewPage extends StatelessWidget {
  const PageViewPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 16, 16, 16),
              Colors.transparent
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Align(
              child: SizedBox(
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            child: Text(
                              maxLines: 2,
                              sliderItems[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeConfig.screenWidth < 395
                                      ? SizeConfig.textSize(32)
                                      : SizeConfig.textSize(36),
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: Text(
                              sliderItems[index].desc,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.textSize(16),
                                  color: Colors.white),
                            ),
                          ),
                        ]),
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.transparent),
                          onPressed: () {},
                          child: Text(
                            maxLines: 1,
                            sliderItems[index].btnText,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: SizeConfig.textSize(12),
                                fontWeight: FontWeight.w600),
                          )),
                    )
                  ],
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            sliderItems[index].imgUrl,
          ),
        ),
      ),
    );
  }
}
