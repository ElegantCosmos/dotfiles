{
	TString filename = "~/.dotfiles/cernroot/publicationStyle.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		std::cout << "Processing file " << filename << std::endl;
		gROOT->ProcessLine(TString(".L ") + filename);
	}
}
