{
	gROOT->SetBatch(kTRUE);
	//TCanvas c("c", "c", 700, 700);
	//c.Draw();

	TH1F hist("hist", "hist", 100, 0, 1e30);
	hist.Fill(0);
	hist.Fill(4, 10);
	hist.Fill(1000000000000, 1e30);
	hist.Draw("Hist");
	hist.GetXaxis()->SetTitle("10^{10} Log_{10} #sqrt{2} E_{pqyg} [cm]");
	hist.GetYaxis()->SetTitle("10^{10} Log_{10} #sqrt{2} E_{pqyg} [A.U.]");
	cout << "gPad->GetWw()" << gPad->GetWw() << endl;
	cout << "gPad->GetWh()" << gPad->GetWh() << endl;
	gPad->SaveAs("histogram_plot.pdf");

    gStyle->SetOptStat("");
	TH2F hist2("hist2", "hist2", 100, -800000, 800000, 100, -800000, 800000);
	hist2.Fill(10, 200, 0);
	hist2.Fill(-100, 600, 100);
	hist2.Fill(100.0, 100.0, 750000);
	hist2.Draw("Colz");
	hist2.GetXaxis()->SetTitle("10^{10} Log_{10} [cm]");
	hist2.GetYaxis()->SetTitle("10^{10} Log_{10} #sqrt{2} [A.U.]");
	//hist2.GetXaxis()->SetNdivisions(505);
    //gPad->Modified();
    gPad->Update();
	TPaletteAxis* pa = dynamic_cast<TPaletteAxis*>(hist2.GetListOfFunctions()->FindObject("palette"));
	pa->SetX1NDC(0.935); pa->SetX2NDC(0.945);
	//pa->GetAxis()->SetTitleOffset(0);
	//pa->GetAxis()->SetTitle("Titlegy [unit]");
    hist2.GetZaxis()->SetTitle("10^{10} Log_{10} [unit]");
    hist2.GetZaxis()->SetTitleOffset(-0.42);
    gPad->Modified();
	gPad->SaveAs("histogram2D_plot.pdf");
	//gPad->SaveAs("histogram2D_plot.png");
	//gPad->SaveAs("histogram2D_plot.tex");
}
