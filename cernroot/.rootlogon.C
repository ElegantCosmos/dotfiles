{
	Double_t zoomFactor = 2.0;

	////Double_t fontSize_large = 0.0744; // 0.05 % of pad height
	////Double_t fontSize = 0.0521; // 0.035 % of pad height
	Double_t fontSize = zoomFactor*9.0; // default font size
	Double_t fontSize_small = zoomFactor*6.0; // small font size
	//Int_t font = 132; // Time New Roman (size of fraction of canvas height)
	Int_t font = 133; // Time New Roman (size in pixel)
	//Double_t canvasWidth = 516.0; // pixels
	//Double_t canvasHeight = 319.0; // pixels
	//Double_t canvasWidth = zoomFactor*248.4; // pixels
	//Double_t canvasHeight = zoomFactor*153.5; // pixels
	//Double_t canvasWidth = zoomFactor*244.8; // pixels
	//Double_t canvasHeight = zoomFactor*151.3; // pixels
	Double_t canvasWidth = zoomFactor*246.0; // pixels
	Double_t canvasHeight = zoomFactor*152.0; // pixels
	Double_t margin = 0.175; // common pad margin

	gStyle->SetTitleFont(font, "t");
	gStyle->SetTitleSize(fontSize, "t");

	gStyle->SetTitleFont(font, "xyz");
	gStyle->SetTitleSize(fontSize, "xyz");
	gStyle->SetTitleOffset(1.2, "x");
	gStyle->SetTitleOffset(1.2, "y");
	//gStyle->SetTitleOffset(-0.4, "z"); // doesn't work in current ROOT 5.34/23

	gStyle->SetLabelFont(font, "xyz");
	gStyle->SetLabelSize(fontSize, "xyz");
	gStyle->SetLabelOffset(0.015, "x");
	gStyle->SetLabelOffset(0.015, "y");
	gStyle->SetLabelOffset(0.015, "z");

	gStyle->SetOptStat("emrou");
	gStyle->SetStatFont(font);
	gStyle->SetStatFontSize(fontSize_small);
	gStyle->SetStatY(1 - margin);
	gStyle->SetStatX(1 - margin);
	gStyle->SetStatW(0.2);
	gStyle->SetStatH(0.15);

	gStyle->SetCanvasBorderMode(0);
	gStyle->SetCanvasBorderSize(0);
	gStyle->SetPadBorderMode(0);
	gStyle->SetPadBorderSize(0);
	gStyle->SetPadTopMargin(margin);
	gStyle->SetPadBottomMargin(margin);
	gStyle->SetPadRightMargin(margin);
	gStyle->SetPadLeftMargin(margin);
	gStyle->SetCanvasDefH(canvasHeight + 25); // canvas height + 25 px = window height)
	gStyle->SetCanvasDefW(canvasWidth + 2); // canvas width + 2 px = window width)

	gStyle->SetNdivisions(10, "xyz");
	//gStyle->SetNdivisions(510, "xyz");
	gStyle->SetTickLength(-5.0/canvasHeight, "x");
	gStyle->SetTickLength(-5.0/canvasWidth, "y");
	gStyle->SetTickLength(-5.0/canvasWidth, "z");

	TGaxis::SetMaxDigits(3);

	//TPaletteAxis* pa = (TPaletteAxis*)h1.GetListOfFunctions()->FindObject("palette");
	//pa->SetX1NDC(0.91); pa->SetX2NDC(0.92); gPad->Modified();
	//pa->GetAxis()->SetTitleOffset(-0.4);
	//pa->GetAxis()->SetTitle("Title [unit]");

	if (gSystem->AccessPathName("~/.rootlogon_local.C") == kTRUE) { // execute if file exists
		gROOT->ProcessLine(".x ~/.rootlogon_local.C");
	}

	if (gSystem->AccessPathName("~/.dotfiles/cernroot/SaveScp.C") == kTRUE) { // load if file exists
		gROOT->ProcessLine(".L ~/.dotfiles/cernroot/SaveScp.C");
	}

}
