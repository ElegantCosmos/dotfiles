void SetPaletteAxis(TH1& hist, const TString& title = "A_{g}^{T} Log_{10} #sqrt{2} E_{pqyg} [unit]")
{
  gPad->Modified();
  gPad->Update();

  TPaletteAxis* axis = dynamic_cast<TPaletteAxis*>(hist.GetListOfFunctions()->FindObject("palette"));
  //axis->SetX1NDC(0.935); axis->SetX2NDC(0.945);
  axis->SetX1NDC(0.92); axis->SetX2NDC(0.93);
  hist.GetZaxis()->SetTitleOffset(-0.40);
  hist.GetZaxis()->SetTitle(title);
  gPad->SetFrameLineWidth(10);
  gPad->Modified();
  gPad->Update();
}
