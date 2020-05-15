int GetColor(int num = 0)
{
	std::vector<std::string> names;
	std::vector<int> colors;

	// Blue
	names.push_back("blue_tableau");
	colors.push_back(TColor::GetColor("#1f77b4"));

	// Orange
	names.push_back("orange_tableau");
	colors.push_back(TColor::GetColor("#ff7f0e"));

	// Green
	names.push_back("green_tableau");
	colors.push_back(TColor::GetColor("#2ca02c"));

	// Red
	names.push_back("red_tableau");
	colors.push_back(TColor::GetColor("#d62728"));

	// Purple
	names.push_back("purple_tableau");
	colors.push_back(TColor::GetColor("#9467bd"));

	// Brown
	names.push_back("brown_tableau");
	colors.push_back(TColor::GetColor("#8c564b"));

	// Pink
	names.push_back("pink_tableau");
	colors.push_back(TColor::GetColor("#e377c2"));

	// Gray
	names.push_back("gray_tableau");
	colors.push_back(TColor::GetColor("#8f7f7f"));

	// Olive
	names.push_back("olive_tableau");
	colors.push_back(TColor::GetColor("#bcbd22"));

	// Cyan
	names.push_back("cyan_tableau");
	colors.push_back(TColor::GetColor("#17becf"));


	return colors.at(num % colors.size());
}
