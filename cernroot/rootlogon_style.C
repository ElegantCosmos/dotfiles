{
	gROOT->SetStyle("Modern");

	// Get window manager decoration height and width
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500);
	unsigned int decorationWidth = 500 - canvas_tmp->GetWw();
	cout << "decorationWidth" << decorationWidth << endl;
	unsigned int decorationHeight = 500 - canvas_tmp->GetWh();
	cout << "decorationHeight" << decorationHeight << endl;
	delete canvas_tmp;
	canvas_tmp = NULL;

	int ppi = 227; // pixels per inch
	double goldenRatio = 0.5*(1 + sqrt(5));

	Int_t font = 133; // Time New Roman (size specified in pixels)
	Double_t fontSize_pt = 9; // default font size
	Double_t fontSize_small_pt = 4; // small font size
	double ptToInch = 3.0/8.0/27;
	double fontSize_px = ppi*ptToInch*fontSize_pt;
	double fontSize_small_px = ppi*ptToInch*fontSize_small_pt;

	double canvasWidth_in = 3.404; // inch, typical width of single column for double column paper
	cout << "canvasWidth_in" << canvasWidth_in << endl;
	double canvasHeight_in = canvasWidth_in/goldenRatio; // inch
	cout << "canvasHeight_in" << canvasHeight_in << endl;

	//// Apply zoom factor for confortable viewing in high DPI screens.
	int canvasWidth_px = int(ppi*canvasWidth_in + 0.5);
	cout << "canvasWidth_px" << canvasWidth_px << endl;
	int canvasHeight_px = int(ppi*canvasHeight_in + 0.5);
	cout << "canvasHeight_px" << canvasHeight_px << endl;

	//// Canvas properties.
	//gStyle->SetCanvasBorderMode(0);
	//gStyle->SetCanvasBorderSize(0);
	//gStyle->SetPadBorderMode(0);
	//gStyle->SetPadBorderSize(0);
	Double_t margin = 0.15; // common pad margin
	double margin_small = 0.6*margin;
	//gStyle->SetPadTopMargin(margin_small);
	gStyle->SetPadTopMargin(margin);
	gStyle->SetPadBottomMargin(margin);
	//gStyle->SetPadRightMargin(margin_small);
	gStyle->SetPadRightMargin(margin);
	gStyle->SetPadLeftMargin(margin);
	gStyle->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	//gStyle->SetCanvasDefH(500); // (canvas height + 25 px) = window height)
	gStyle->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)
	//gStyle->SetCanvasDefW(500); // (canvas width + 2 px) = window width)

	gStyle->SetTitleFont(font, "t"); // doesn't work in current ROOT 5.34/23
	gStyle->SetTitleSize(fontSize_px, "t"); // doesn't work in current ROOT 5.34/23

	gStyle->SetTitleFont(font, "xyz");
	gStyle->SetTitleSize(fontSize_px, "xyz");
	gStyle->SetTitleOffset(1.2, "x");
	gStyle->SetTitleOffset(1.2, "y");
	gStyle->SetTitleOffset(-1.2, "z"); // doesn't work in current ROOT 5.34/23

	gStyle->SetLabelFont(font, "xyz");
	gStyle->SetLabelSize(fontSize_px, "xyz");
	gStyle->SetLabelOffset(0.02, "x");
	gStyle->SetLabelOffset(0.02, "y");
	gStyle->SetLabelOffset(0.02, "z");

	gStyle->SetOptStat("emrou");
	gStyle->SetStatFont(font);
	gStyle->SetStatFontSize(fontSize_small_px);
	gStyle->SetStatY(1 - margin_small);
	gStyle->SetStatX(1 - margin_small);
	gStyle->SetStatW(0.2);
	gStyle->SetStatH(0.1);

	//gStyle->SetNdivisions(10, "xyz");
	gStyle->SetNdivisions(510, "xyz"); // show sub-ticks
	gStyle->SetTickLength(-10.0/canvasHeight_px, "x");
	gStyle->SetTickLength(-10.0/canvasWidth_px, "y");
	gStyle->SetTickLength(-10.0/canvasWidth_px, "z");

	TGaxis::SetMaxDigits(4);

	//// Example of how to make palette axis neat
	//TH2F hist2("hist2", "hist2", 100, 0, 10000, 100, 0, 10000);
	//hist2.Fill(0.0, 0.0, 10);
	//hist2.Fill(0.0, 100.0, 100);
	//hist2.Fill(100.0, 100.0, 1000000);
	//hist2.Draw("Colz");
	//hist2.GetXaxis()->SetTitle("gpqy-axis [cm]");
	//hist2.GetYaxis()->SetTitle("gpqy-axis [A.U.]");
    ////gPad->Modified();
    //gPad->Update();
	//TPaletteAxis* pa = dynamic_cast<TPaletteAxis*>(hist2.GetListOfFunctions()->FindObject("palette"));
	//pa->SetX1NDC(0.90); pa->SetX2NDC(0.91);
	////pa->GetAxis()->SetTitleOffset(0);
	////pa->GetAxis()->SetTitle("Titlegy [unit]");
    //hist2.GetZaxis()->SetTitle("Titlegy [unit]");
    //hist2.GetZaxis()->SetTitleOffset(-0.3);
}
