{
  TH1F hist("hist", "hist", 100, 0, 1e30);
  hist.Fill(0);
  hist.Fill(4, 10);
  hist.Fill(1000000000000, 1e30);
  hist.SetLineColor(orange_tableau);
  hist.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [cm]");
  hist.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [A.U.]");
  hist.Draw("Hist");
  //SetLogY();
  SetLogX();
  //cout << "gPad->GetWw()" << gPad->GetWw() << endl;
  //cout << "gPad->GetWh()" << gPad->GetWh() << endl;
  gPad->SaveAs("histogram_plot.pdf");

  gStyle->SetOptStat("");
  TH2F hist2("hist2", "hist2", 100, 1, 800000, 100, 1, 8000);
  hist2.Fill(10, 200, 0);
  hist2.Fill(-100, 600, 100);
  hist2.Fill(100.0, 100.0, 750000000);
  hist2.GetXaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [cm]");
  hist2.GetYaxis()->SetTitle("A_{g}^{T}  Log_{10} #sqrt{2} E_{pqyg} [A.U.]");
  hist2.Draw("Colz");
  SetLogY(false);
  //SetLogX();

  SetPaletteAxis(hist2);
  //gPad->Modified();
  //gPad->Update();
  //TPaletteAxis* pa = dynamic_cast<TPaletteAxis*>(hist2.GetListOfFunctions()->FindObject("palette"));
  //pa->SetX1NDC(0.935); pa->SetX2NDC(0.945);
  ////pa->GetAxis()->SetTitleOffset(0);
  ////pa->GetAxis()->SetTitle("Titlegy [unit]");
  //hist2.GetZaxis()->SetTitle("A_{g}^{T} Log_{10} #sqrt{2} E_{pqyg} [unit]");
  //hist2.GetZaxis()->SetTitleOffset(-0.40);
  //gPad->SetFrameLineWidth(10);
  gPad->Modified();
  gPad->SaveAs("histogram2D_plot.pdf");
  //gPad->SaveAs("histogram2D_plot.png");
  //gPad->SaveAs("histogram2D_plot.tex");
}
