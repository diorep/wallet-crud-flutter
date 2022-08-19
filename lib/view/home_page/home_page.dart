import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../core/theme/app_text_styles.dart';
import '../../repositories/user_repository.dart';
import '../modal_sheet_views/modal_bottom_sheet_view.dart';
import '../util/card_model.dart';
import '../util/list_tile_transactions.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late UserRepository _userRepository;

  final PageController pCardsController = PageController(viewportFraction: 0.9);

  final GlobalKey _scaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _userRepository = context.watch<UserRepository>();
    return Scaffold(
      key: _scaffold,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => modalBottomSheetView(_scaffold.currentContext!),
        backgroundColor: AppColors.baseColor200,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: AppColors.baseColor200,
        child: IconTheme(
          data: IconThemeData(color: AppColors.baseColor),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
      backgroundColor: AppColors.baseColor,
      body: SafeArea(
        //App bar
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${_userRepository.user.nickname} ', style: AppTextStyles.homeLabelBold),
                        Text('Wallet', style: AppTextStyles.homeLabel),
                      ],
                    ),
                    //Add button
                  ],
                ),
              ),
              const SizedBox(height: 25),

              //cards
              SizedBox(
                height: 200,
                child: PageView(
                  controller: pCardsController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardModel(
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: pCardsController,
                count: 1,
                effect: ExpandingDotsEffect(
                  dotColor: AppColors.baseColor300,
                  activeDotColor: AppColors.baseColor200,
                ),
              ),
              const SizedBox(height: 25),

              //buttons
              //column stats transactions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Weekend Transactions',
                      style: AppTextStyles.homeTitles,
                    ),
                  ],
                ),
              ),

              //transactions
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      ListTileTransaction(
                        title: 'Food',
                        description: 'Venda da Dona Bahiana',
                        amount: 15,
                        iconPath: AppIcons.dinnerIcon,
                        data: '12/08/22',
                        isDebit: false,
                      ),
                      ListTileTransaction(
                        title: 'Food',
                        description: 'Venda da Dona Bahiana',
                        amount: 24,
                        iconPath: AppIcons.dinnerIcon,
                        data: '12/08/22',
                        isDebit: true,
                      ),
                      ListTileTransaction(
                        title: 'Transport',
                        description: 'Onibus',
                        amount: 24,
                        iconPath: AppIcons.dinnerIcon,
                        data: '13/08/22',
                        isDebit: true,
                      ),
                      ListTileTransaction(
                        title: 'Deposit',
                        description: 'Bank',
                        amount: 90,
                        iconPath: AppIcons.dinnerIcon,
                        data: '13/08/22',
                        isDebit: false,
                      ),
                      ListTileTransaction(
                        title: 'Deposit',
                        description: 'Bank',
                        amount: 90,
                        iconPath: AppIcons.dinnerIcon,
                        data: '13/08/22',
                        isDebit: false,
                      ),
                      ListTileTransaction(
                        title: 'Deposit',
                        description: 'Bank',
                        amount: 90,
                        iconPath: AppIcons.dinnerIcon,
                        data: '13/08/22',
                        isDebit: false,
                      ),
                      ListTileTransaction(
                        title: 'Deposit',
                        description: 'Bank',
                        amount: 90,
                        iconPath: AppIcons.dinnerIcon,
                        data: '13/08/22',
                        isDebit: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
