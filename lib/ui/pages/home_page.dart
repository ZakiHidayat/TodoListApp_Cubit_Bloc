import 'package:crud_todolist_cubit_bloc/cubit/product_cubit.dart';
import 'package:crud_todolist_cubit_bloc/routes/app_route.dart';
import 'package:crud_todolist_cubit_bloc/ui/pages/edit_product_page.dart';
import 'package:crud_todolist_cubit_bloc/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../shared/app_theme.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.3,
                  color: Colors.black
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          backgroundColor: Colors.white,
          child: Icon(
              Icons.add,
              color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.addProductPage);
          },
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'All Your List'.toUpperCase(),
            style: GoogleFonts.spaceGrotesk(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-color-img.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.products.isEmpty) {
                return Center(
                  child: Text(
                    'NOTHING TO SEE HERE'.toUpperCase(),
                    style: GoogleFonts.archivo(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.3)
                    ),
                  ),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (_, index) {
                      final product = state.products[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomCard(
                          children: [
                            Text(
                              product.title,
                              style: GoogleFonts.archivo(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              product.desc,
                              style: GoogleFonts.archivo(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomButton(
                                  backgroundColor: Colors.amber,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditProductPage(
                                            product: product,
                                          ),
                                        ));
                                  },
                                  title: 'Edit',
                                  height: 30,
                                  width: 100,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomButton(
                                  backgroundColor: Colors.red,
                                  onPressed: () {
                                    context
                                        .read<ProductCubit>()
                                        .deleteProduct(product);
                                  },
                                  title: 'Delete',
                                  height: 30,
                                  width: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: state.products.length);
              }
            },
          ),
        ));
  }
}
