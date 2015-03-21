{
	std::string styleFile_str = "~/data/personal/root/style.root";
	TFile *styleFile = new TFile(styleFile_str.c_str(), "read");
	TStyle *style = NULL;
	styleFile->GetObject("style", style);
	style->cd();
	gROOT->ForceStyle(1);
}
