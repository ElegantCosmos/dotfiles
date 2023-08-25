{
	publicationStyle::ApplyStyle();
	palette = publicationStyle::Palette("tableau_10");


	TCanvas c0("c0", "c0");
	c0.SetGrid();
	std::vector<double> xs = {-1000, -500, 0, 500, 1000};
	std::vector<double> ys = {-1000, -500, 0, 500, 1000};
	TGraph graph(xs.size(), &xs[0], &ys[0]);
	graph.Draw("ALP");
	//graph.SetLineColor(palette.GetColor("blue"));
	//graph.SetMarkerColor(palette.GetColor("blue"));
	graph.GetXaxis()->SetTitle("A_{g}^{T} [cm] #sqrt{2} Log_{10}/E_{pqyg}");
	graph.GetYaxis()->SetTitle("A_{g}^{T} [A.U.] #sqrt{2} Log_{10}/E_{pqyg}");
	graph.GetXaxis()->SetLimits(-1000, 1000);
	//graph.SetMaximum(5);
	//graph.SetMinimum(-1);
	graph.GetYaxis()->SetRangeUser(-1000, 1000); // also works
	////publicationStyle::SetLogX(&graph);
	////publicationStyle::SetLogY(&graph);
	publicationStyle::FormatAxes(&graph);
	gPad->Update();
	gPad->SaveAs("cernroot_graph.pdf");
	gPad->SaveAs("cernroot_graph.tex");


	TCanvas c1("c1", "c1");
	TH1F hist("hist", "hist", 10, 0, 1e4);
	hist.Fill(0);
	hist.Fill(5e3, 1e3);
	hist.Fill(9e3, 1e3);
	hist.Draw();
	hist.SetLineColor(palette.GetColor("orange"));
	hist.SetMarkerColor(palette.GetColor("orange"));
	hist.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [cm] #sqrt{2}");
	hist.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [A.U.] #sqrt{2}");
	//cout << "gPad->GetWw()" << gPad->GetWw() << endl;
	//cout << "gPad->GetWh()" << gPad->GetWh() << endl;
	//hist.GetXaxis()->SetRangeUser(50e27, 400e27);
	//hist.GetYaxis()->SetRangeUser(-1e30, 3e30);
	//hist.SetMaximum(3e30);
	//hist.SetMinimum(-1e30);
	publicationStyle::FormatAxes(&hist);
	//publicationStyle::SetLogX(&hist);
	gPad->SaveAs("cernroot_hist.pdf");


	TCanvas c2("c2", "c2");
	gStyle->SetOptStat("");
	TH2F hist2("hist2", "hist2", 10, -800, 800, 10, -800, 800);
	hist2.Fill(10, 50, 0);
	hist2.Fill(-10, 60, 100);
	hist2.Fill(70, 70, 750);
	hist2.Draw("Colz");
	hist2.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [cm] #sqrt{2}");
	hist2.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [A.U.] #sqrt{2}");
	//publicationStyle::FormatPaletteAxis(&hist2);
	//hist2.GetXaxis()->SetRangeUser(10, 90);
	//hist2.GetYaxis()->SetRangeUser(10, 80);
	////publicationStyle::SetLogY(&hist2);
	////publicationStyle::SetLogX(&hist2);
	publicationStyle::FormatAxes(&hist2);
	publicationStyle::FormatPaletteAxis(&hist2);
	gPad->SetLogz();
	gPad->SaveAs("cernroot_hist2d.pdf");
	//gPad->SaveAs("cernroot_hist2d.png");
	//gPad->SaveAs("cernroot_hist2d.tex");
}
