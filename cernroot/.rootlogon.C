{
	TString file;

	file = "~/.rootlogon_local.C";
	gSystem->ExpandPathName(file);
	if (gSystem->AccessPathName(file) == kFALSE) { // execute if file exists
		gROOT->ProcessLine(TString(".x ") + file);
	}

	file = "~/.rootlogon_style.C";
	gSystem->ExpandPathName(file);
	if (gSystem->AccessPathName(file) == kFALSE) { // load if file exists
		gROOT->ProcessLine(TString(".x ") + file);
	}

	file = "~/.dotfiles/cernroot/SaveOpen.C";
	gSystem->ExpandPathName(file);
	if (gSystem->AccessPathName(file) == kFALSE) { // load if file exists
		gROOT->ProcessLine(TString(".L ") + file);
	}
}
