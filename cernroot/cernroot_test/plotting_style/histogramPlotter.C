{
  TCanvas c0("c0", "c0");
  TH1F hist("hist", "hist", 5, 0, 1e30);
  hist.Fill(0);
  hist.Fill(4, 10);
  hist.Fill(1000000000000, 1e30);
  hist.Draw();
  hist.SetLineColor(orange_tableau);
  hist.SetMarkerColor(orange_tableau);
  hist.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [cm]");
  hist.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [A.U.]");
  //cout << "gPad->GetWw()" << gPad->GetWw() << endl;
  //cout << "gPad->GetWh()" << gPad->GetWh() << endl;
  hist.GetXaxis()->SetRangeUser(50e27, 400e27);
  hist.GetYaxis()->SetRangeUser(-1e30, 3e30);
  //hist.SetMaximum(3e30);
  //hist.SetMinimum(-1e30);
  //plotting::SetLogX();
  //plotting::SetLogY();
  gPad->SaveAs("histogram_plot.pdf");

  TCanvas c1("c1", "c1");
  gStyle->SetOptStat("");
  TH2F hist2("hist2", "hist2", 10, 0, 100, 10, 0, 100);
  hist2.Fill(10, 50, 0);
  hist2.Fill(-10, 60, 100);
  hist2.Fill(70, 70, 750000000);
  hist2.Draw("Colz");
  hist2.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [cm]");
  hist2.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [A.U.]");
  plotting::SetPaletteAxis(&hist2);
  //plotting::SetLogY();
  //plotting::SetLogX(&hist2);
  hist2.GetXaxis()->SetRangeUser(10, 90);
  hist2.GetYaxis()->SetRangeUser(10, 80);
  gPad->SaveAs("histogram2D_plot.pdf");
  //gPad->SaveAs("histogram2D_plot.png");
  //gPad->SaveAs("histogram2D_plot.tex");


  TCanvas c2("c2", "c2");
  std::vector<double> xs = {0, 1, 2};
  std::vector<double> ys = {0, 1, 1};
  TGraph graph(xs.size(), &xs[0], &ys[0]);
  graph.Draw("ALP");
  plotting::SetLogX(false);
  plotting::SetLogY(false);
  graph.GetXaxis()->SetLimits(0, 5);
  graph.GetYaxis()->SetRangeUser(-1, 5); // also works
  //graph.SetMaximum(5);
  //graph.SetMinimum(-1);
  gPad->Update();
  gPad->SaveAs("graph_plot.pdf");
}
