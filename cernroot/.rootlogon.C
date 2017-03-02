{
	if (gSystem->AccessPathName("~/.rootlogon_local.C") == kTRUE) { // execute if file exists
		gROOT->ProcessLine(".x ~/.rootlogon_local.C");
	}

	if (gSystem->AccessPathName("~/.dotfiles/cernroot/SaveOpen.C") == kTRUE) { // load if file exists
		gROOT->ProcessLine(".L ~/.dotfiles/cernroot/SaveOpen.C");
	}

	gROOT->SetStyle("Modern");

	const Double_t zoomFactor = 2.0;
	const Double_t goldenRatio = (1 + sqrt(5))/2.0;

	Double_t fontSize = 9.0; // default font size
	Double_t fontSize_small = 6.0; // small font size
	Int_t font = 133; // Time New Roman (size in pixel)
	Double_t canvasWidth = 246.0; // pixels, typical width of single column for double column paper
	Double_t canvasHeight = canvasWidth/goldenRatio; // pixels
	Double_t margin = 0.175; // common pad margin

	// Apply zoom factor for confortable viewing in high DPI screens.
	fontSize *= zoomFactor;
	fontSize_small *= zoomFactor;
	canvasWidth *= zoomFactor;
	canvasHeight *= zoomFactor;

	// Canvas properties.
	gStyle->SetCanvasBorderMode(0);
	gStyle->SetCanvasBorderSize(0);
	gStyle->SetPadBorderMode(0);
	gStyle->SetPadBorderSize(0);
	gStyle->SetPadTopMargin(margin);
	gStyle->SetPadBottomMargin(margin);
	gStyle->SetPadRightMargin(margin);
	gStyle->SetPadLeftMargin(margin);
	gStyle->SetCanvasDefH(canvasHeight + 25); // (canvas height + 25 px) = window height)
	gStyle->SetCanvasDefW(canvasWidth + 2); // (canvas width + 2 px) = window width)

	//gStyle->SetTitleFont(font, "t"); // doesn't work in current ROOT 5.34/23
	//gStyle->SetTitleSize(fontSize, "t"); // doesn't work in current ROOT 5.34/23

	gStyle->SetTitleFont(font, "xyz");
	gStyle->SetTitleSize(fontSize, "xyz");
	gStyle->SetTitleOffset(1.4, "x");
	gStyle->SetTitleOffset(1.6, "y");
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

	gStyle->SetNdivisions(10, "xyz");
	//gStyle->SetNdivisions(510, "xyz"); // show sub-ticks
	gStyle->SetTickLength(-7.0/canvasHeight, "x");
	gStyle->SetTickLength(-7.0/canvasWidth, "y");
	gStyle->SetTickLength(-7.0/canvasWidth, "z");

	TGaxis::SetMaxDigits(3);

	//// Some extra command here for reference. Used when showing colored z-axis.
	//TPaletteAxis* pa = (TPaletteAxis*)h1.GetListOfFunctions()->FindObject("palette");
	//pa->SetX1NDC(0.91); pa->SetX2NDC(0.92); gPad->Modified();
	//pa->GetAxis()->SetTitleOffset(-0.4);
	//pa->GetAxis()->SetTitle("Title [unit]");
}
