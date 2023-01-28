{
	palette = plotting::Palette("tableau");

	TCanvas c0("c0", "c0");
	TH1F hist("hist", "hist", 5, 0, 1e30);
	hist.Fill(0);
	hist.Fill(4, 10);
	hist.Fill(1000000000000, 1e30);
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
	//plotting::SetLogY(&hist);
	//gPad->SetLogx();
	plotting::SetLogX(&hist);
	gPad->SaveAs("histogram_plot.pdf");

	TCanvas c1("c1", "c1");
	gStyle->SetOptStat("");
	TH2F hist2("hist2", "hist2", 10, -800, 800, 10, -800, 800);
	hist2.Fill(10, 50, 0);
	hist2.Fill(-10, 60, 100);
	hist2.Fill(70, 70, 750);
	hist2.Draw("Colz");
	hist2.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [cm] #sqrt{2}");
	hist2.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10}/E_{pqyg} [A.U.] #sqrt{2}");
	plotting::SetPaletteAxis(&hist2);
	//hist2.GetXaxis()->SetRangeUser(10, 90);
	//hist2.GetYaxis()->SetRangeUser(10, 80);
	//plotting::SetLogY(&hist2);
	//plotting::SetLogX(&hist2);
	gPad->SetLogz();
	gPad->SaveAs("histogram2D_plot.pdf");
	//gPad->SaveAs("histogram2D_plot.png");
	//gPad->SaveAs("histogram2D_plot.tex");


	TCanvas c2("c2", "c2");
	std::vector<double> xs = {1, 100, 200000, 300000000, 5000000000000};
	std::vector<double> ys = {1, 100, 100000, 100000000, 1000000000000};
	TGraph graph(xs.size(), &xs[0], &ys[0]);
	graph.Draw("ALP");
	graph.SetLineColor(palette.GetColor("blue"));
	graph.SetMarkerColor(palette.GetColor("blue"));
	graph.GetXaxis()->SetTitle("A_{g}^{T} [cm] #sqrt{2} Log_{10}/E_{pqyg}");
	graph.GetYaxis()->SetTitle("A_{g}^{T} [A.U.] #sqrt{2} Log_{10}/E_{pqyg}");
	//graph.GetXaxis()->SetLimits(0, 5);
	//graph.GetYaxis()->SetRangeUser(-1, 5); // also works
	//graph.SetMaximum(5);
	//graph.SetMinimum(-1);
	//plotting::SetLogX(&graph);
	//plotting::SetLogY(&graph);
	gPad->Update();
	gPad->SaveAs("graph_plot.pdf");
}
