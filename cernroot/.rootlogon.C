{
	TString filename;

	filename = "~/.rootlogon_style.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // execute if filename exists
		gROOT->ProcessLine(TString(".x ") + filename);
	}

	filename = "~/.rootlogon_local.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // execute if filename exists
		gROOT->ProcessLine(TString(".x ") + filename);
	}

	filename = "~/.dotfiles/cernroot/GlobalPlottingFunctions.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}
}
