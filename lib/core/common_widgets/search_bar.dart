import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/assets/colors.dart';

class SearchBar extends StatefulWidget {
  final TextStyle? searchTextStyle;
  final String? searchHintText;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController? searchController;
  final void Function()? onTap;
  final bool showSearchIcon;
  final bool showResetIcon;
  final InputBorder? enabledBorder;
  final bool? enabled;

  const SearchBar({
    Key? key,
    this.showResetIcon = false,
    this.enabledBorder,
    this.showSearchIcon = true,
    this.searchTextStyle,
    this.searchHintText,
    this.onSubmitted,
    this.onChanged,
    this.searchController,
    this.onTap, this.enabled=true,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      cursorColor: AppColors.searchBarColor,
      style: widget.searchTextStyle,
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: widget.showSearchIcon
            ? const Icon(
                Icons.search,
                color: AppColors.searchBarColor,
                size: 25.0,
              )
            : const SizedBox(),
        suffixIcon: widget.showResetIcon
            ? IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.searchBarColor,
                  size: 20,
                ),
                onPressed: () {
                  widget.onSubmitted?.call('');
                  final controller =
                      widget.searchController ?? _searchController;
                  setState(() {
                    controller.text = '';
                    controller.clear();
                  });
                },
              )
            : const SizedBox(),
        hintText: widget.searchHintText ?? "search_here".tr(),
        hintStyle: const TextStyle(color: AppColors.searchBarColor),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.searchBarColor,
          ),
        ),
        enabledBorder: widget.enabledBorder ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.searchBarColor,
              ),
            ),
      ),
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      controller: widget.searchController ?? _searchController,
      onSubmitted: widget.onSubmitted,
    );
  }
}
