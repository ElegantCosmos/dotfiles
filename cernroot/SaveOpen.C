void SaveOpen(const std::string file = "plot.pdf", int nFiles = 1) // Draw and copy quickly with one function.
{
	assert(!file.empty()); // filename must not be empty
	if (gPad == NULL) { // check if pad for plot exists
		std::cerr << "No gPad object found for plot." << std::endl;
		return;
	}

	std::string file_base;
	{
		size_t dotPos = file.find_last_of(".");
		file_base = file.substr(0, dotPos);
		const std::string plotStr = "plot";
		if (file_base.substr(file_base.length() - plotStr.length(), plotStr.length()) != plotStr) {
			file_base += std::string("_") + plotStr;
		}
	}

	const std::string file_pdf = file_base + ".pdf";
	gPad->SaveAs(file_pdf.c_str()); // save plot as PDF

	const std::string file_C = file_base + ".C";
	gPad->SaveAs(file_C.c_str()); // save plot as script

	//const std::string file_ROOT = file_base + ".root";
	//gPad->SaveAs(file_ROOT.c_str()); // save plot in ROOT file

	// Open PDF plots locally.
	assert(nFiles > 0);
	if (nFiles == 1) {
		gSystem->Exec("openlatest");
	} else {
		TString cmd;
		cmd.Form("openlatest %i", nFiles);
		gSystem->Exec(cmd.Data());
	}

	return;
}
