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

	filename = "~/.dotfiles/cernroot/SaveOpen.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}

	filename = "~/.dotfiles/cernroot/SetLinX.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}

	filename = "~/.dotfiles/cernroot/SetLogX.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}

	filename = "~/.dotfiles/cernroot/SetLinY.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}

	filename = "~/.dotfiles/cernroot/SetLogY.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}

	filename = "~/.dotfiles/cernroot/SetPaletteAxis.C";
	gSystem->ExpandPathName(filename);
	if (gSystem->AccessPathName(filename) == kFALSE) { // load if filename exists
		gROOT->ProcessLine(TString(".L ") + filename);
	}
}
