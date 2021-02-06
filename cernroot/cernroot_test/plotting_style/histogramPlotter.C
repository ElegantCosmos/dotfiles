{
  TH1F hist("hist", "hist", 100, 0, 1e30);
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
  plotting::SetLogX(&hist);
  plotting::SetLogY(&hist);
  gPad->SaveAs("histogram_plot.pdf");

  gStyle->SetOptStat("");
  TH2F hist2("hist2", "hist2", 100, 1, 800000, 100, 1, 8000);
  hist2.Fill(10, 200, 0);
  hist2.Fill(-100, 600, 100);
  hist2.Fill(100.0, 100.0, 750000000);
  hist2.Draw("Colz");

  //for (TObject* obj = primitives->MakeIterator(); obj != primitives->Last(); ++obj) {
  //  cout << "name " << obj->GetName() << endl;
  //}

  hist2.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [cm]");
  hist2.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [A.U.]");
  plotting::SetPaletteAxis(&hist2);
  //plotting::SetLogY();
  //plotting::SetLogX(&hist2);
  gPad->SaveAs("histogram2D_plot.pdf");
  //gPad->SaveAs("histogram2D_plot.png");
  //gPad->SaveAs("histogram2D_plot.tex");
}
