{
	gROOT->ProcessLine(".x $CUORE_INSTALL/lib/diana_root.C");
	gROOT->ProcessLine(".L ~/.dotfiles/cernroot/SaveScp.C");

	//Double_t textsize_large = 0.0744; // 0.05 % of pad height
	//Double_t textsize_small = 0.0521; // 0.035 % of pad height
	Double_t textsize_small = 17; // 0.05 % of pad height
	gStyle->SetTitleFont(133, "t");
	gStyle->SetTitleSize(textsize_small, "t");

	gStyle->SetTitleFont(133, "xyz");
	gStyle->SetTitleSize(textsize_small, "xyz");
	gStyle->SetTitleOffset(1.2, "x");
	gStyle->SetTitleOffset(1.0, "y");

	gStyle->SetLabelFont(133, "xyz");
	gStyle->SetLabelSize(textsize_small, "xyz");
	gStyle->SetLabelOffset(0.01, "x");
	gStyle->SetLabelOffset(0.01, "y");

	gStyle->SetOptStat("emrou");
	gStyle->SetStatFont(133);
	gStyle->SetStatFontSize(textsize_small);
	gStyle->SetStatY(0.925);
	gStyle->SetStatX(0.9);
	gStyle->SetStatW(0.2);
	gStyle->SetStatH(0.15);

	gStyle->SetCanvasBorderMode(0);
	gStyle->SetCanvasBorderSize(0);
	gStyle->SetPadBorderMode(0);
	gStyle->SetPadBorderSize(0);
	gStyle->SetPadTopMargin(0.075);
	gStyle->SetPadBottomMargin(0.125);
	gStyle->SetCanvasDefH(344); // real canvas width of 319 px (+2 px)
	gStyle->SetCanvasDefW(518); // real canvas height of 516 px (+25 px)
}
