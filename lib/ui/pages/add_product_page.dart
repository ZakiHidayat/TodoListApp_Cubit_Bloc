import 'package:crud_todolist_cubit_bloc/cubit/product_cubit.dart';
import 'package:crud_todolist_cubit_bloc/models/product.dart';
import 'package:crud_todolist_cubit_bloc/ui/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../routes/app_route.dart';
import '../../shared/app_theme.dart';
import '../widgets/custom_button.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add List',
          style: GoogleFonts.spaceGrotesk(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-color-img.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'List Title',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(controller: nameController, hintText: 'List Title'),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Desc Title',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(controller: priceController, hintText: 'Desc Title'),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                backgroundColor: AppTheme.purpleColor,
                height: 50,
                onPressed: () {
                  final product = Product(
                      title: nameController.text, desc: priceController.text);
                  context.read<ProductCubit>().addProduct(product);
                  Navigator.of(context).pushReplacementNamed(AppRoute.homePage);
                },
                title: 'Simpan',
              )
            ],
          ),
        ),
      ),
    );
  }
}
