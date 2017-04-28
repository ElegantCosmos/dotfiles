{
	if (gSystem->AccessPathName("~/.rootlogon_local.C") == kTRUE) { // execute if file exists
		gROOT->ProcessLine(".x ~/.rootlogon_local.C");
	}
	if (gSystem->AccessPathName("~/.dotfiles/cernroot/SaveOpen.C") == kTRUE) { // load if file exists
		gROOT->ProcessLine(".L ~/.dotfiles/cernroot/SaveOpen.C");
	}
	//if (gSystem->AccessPathName("~/.dotfiles/cernroot/rootlogon_style.C") == kTRUE) {
	//	gROOT->ProcessLine(".L ~/.dotfiles/cernroot/rootlogon_style.C");
	//}
}
